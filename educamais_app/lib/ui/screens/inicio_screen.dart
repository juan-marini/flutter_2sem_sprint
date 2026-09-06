import 'package:flutter/material.dart';

import '../../model/alerta_evasao.dart';
import '../../model/curso.dart';
import '../../model/risco_evasao.dart';
import '../../navigation/app_routes.dart';
import '../../repository/alerta_repository.dart';
import '../../repository/curso_repository.dart';
import '../../repository/sala_repository.dart';
import '../../repository/usuario_repository.dart';
import '../../theme/app_colors.dart';
import '../components/curso_card.dart';
import '../components/indicator_card.dart';
import '../components/sala_card.dart';

/// Aba Início: saudação, indicadores, alerta preditivo em destaque,
/// "Continue de onde parou", salas de hoje e o bloco de Modo áudio.
class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  String _saudacao() {
    final hora = DateTime.now().hour;
    if (hora < 12) {
      return 'Bom dia';
    }
    if (hora < 18) {
      return 'Boa tarde';
    }
    return 'Boa noite';
  }

  @override
  Widget build(BuildContext context) {
    final usuario = getUsuarioLogado();
    final cursos = getAllCursos();
    final cursosEmAndamento = cursos
        .where((curso) => !curso.concluido && !curso.naoIniciado)
        .toList();
    final alertas = getAllAlertas();
    final alertaDestaque = alertas.isEmpty
        ? null
        : alertas.reduce(
            (a, b) => a.probabilidade >= b.probabilidade ? a : b,
          );
    final salasHoje = getAllSalas()
        .where((sala) => sala.horario.startsWith('Hoje'))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_saudacao()}, ${usuario.primeiroNome}!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            'Continue sua jornada de aprendizado hoje.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: IndicatorCard(
                    icone: Icons.menu_book_outlined,
                    valor: '${cursosEmAndamento.length}',
                    rotulo: 'Cursos em andamento',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: IndicatorCard(
                    icone: Icons.local_fire_department,
                    valor: '${usuario.ofensivaDias}',
                    rotulo: 'Dias de ofensiva',
                    corDestaque: AppColors.atencao,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: IndicatorCard(
                    icone: Icons.schedule,
                    valor: '${usuario.horasEstudo.toStringAsFixed(1)}h',
                    rotulo: 'Horas de estudo',
                  ),
                ),
              ],
            ),
          ),
          if (alertaDestaque != null) ...[
            const SizedBox(height: 24),
            _AlertaDestaqueCard(alerta: alertaDestaque, cursos: cursos),
          ],
          const SizedBox(height: 24),
          Text(
            'Continue de onde parou',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          if (cursosEmAndamento.isEmpty)
            Text(
              'Nenhum curso em andamento no momento.',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          else
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cursosEmAndamento.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final curso = cursosEmAndamento[index];
                  return SizedBox(
                    width: 260,
                    child: CursoCard(
                      curso: curso,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.cursoDetalhe,
                          arguments: curso,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          if (salasHoje.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              'Salas de hoje',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...salasHoje.map(
              (sala) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SalaCard(
                  sala: sala,
                  onTap: () async {
                    final confirmou = await Navigator.pushNamed(
                      context,
                      AppRoutes.salaDetalhe,
                      arguments: sala,
                    );
                    if (confirmou == true && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Participação confirmada em "${sala.titulo}"',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),
          const _ModoAudioCard(),
        ],
      ),
    );
  }
}

class _AlertaDestaqueCard extends StatelessWidget {
  final AlertaEvasao alerta;
  final List<Curso> cursos;

  const _AlertaDestaqueCard({required this.alerta, required this.cursos});

  @override
  Widget build(BuildContext context) {
    final cor = switch (alerta.nivel) {
      RiscoEvasao.baixo => AppColors.sucesso,
      RiscoEvasao.medio => AppColors.atencao,
      RiscoEvasao.alto => AppColors.risco,
    };

    Curso? cursoRelacionado;
    for (final curso in cursos) {
      if (curso.titulo == alerta.cursoRelacionado) {
        cursoRelacionado = curso;
        break;
      }
    }

    return Material(
      color: cor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: cursoRelacionado == null
            ? null
            : () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.cursoDetalhe,
                  arguments: cursoRelacionado,
                );
              },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.superficieClara,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      alerta.titulo,
                      style: const TextStyle(
                        color: AppColors.superficieClara,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${alerta.probabilidade}%',
                    style: const TextStyle(
                      color: AppColors.superficieClara,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                alerta.descricao,
                style: TextStyle(
                  color: AppColors.superficieClara.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.superficieClara.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: AppColors.superficieClara,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        alerta.acaoSugerida,
                        style: const TextStyle(color: AppColors.superficieClara),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModoAudioCard extends StatelessWidget {
  const _ModoAudioCard();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Modo áudio chega em breve.')),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.azulEletrico, AppColors.ciano],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.headphones,
                color: AppColors.superficieClara,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Modo áudio',
                      style: TextStyle(
                        color: AppColors.superficieClara,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ouça o conteúdo dos seus cursos em áudio, no seu '
                      'ritmo.',
                      style: TextStyle(
                        color: AppColors.superficieClara.withValues(
                          alpha: 0.9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
