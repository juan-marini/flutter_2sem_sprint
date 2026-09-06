import 'package:flutter/material.dart';

import '../../model/aula.dart';
import '../../model/curso.dart';
import '../../model/modulo.dart';
import '../../model/tipo_aula.dart';
import '../../navigation/app_routes.dart';
import '../../theme/app_colors.dart';
import '../components/app_top_bar.dart';
import '../components/risco_badge.dart';

/// Detalhe de um curso. Recebe o [Curso] selecionado pela lista por meio
/// dos argumentos da rota — por isso [curso] e sempre nullable e a tela
/// trata o caso nulo com um estado vazio em vez de quebrar.
class CursoDetalheScreen extends StatelessWidget {
  final Curso? curso;
  final VoidCallback onBackClick;

  const CursoDetalheScreen({
    super.key,
    required this.curso,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    final curso = this.curso;
    return Scaffold(
      appBar: AppTopBar(
        titulo: curso?.titulo ?? 'Curso',
        onBackClick: onBackClick,
      ),
      body: curso == null
          ? const Center(child: Text('Nenhum curso selecionado.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TagChip(texto: curso.categoria.toUpperCase()),
                      if (curso.obrigatorio) const _TagChip(texto: 'OBRIGATÓRIO'),
                      RiscoBadge(risco: curso.risco),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    curso.titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    curso.descricao,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: curso.progresso.clamp(0, 1).toDouble(),
                      minHeight: 8,
                      backgroundColor: AppColors.divisorClaro,
                      valueColor: AlwaysStoppedAnimation(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${curso.percentual}% concluído • ${curso.aulasConcluidas}/'
                    '${curso.totalAulas} aulas • ${curso.cargaHoraria}h',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.12),
                        child: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Instrutor',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              curso.instrutor,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: curso.concluido
                          ? null
                          : () {
                              final proxima = curso.proximaAula;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    proxima == null
                                        ? 'Você já concluiu todas as aulas '
                                              'deste curso.'
                                        : 'Assistindo: ${proxima.titulo}',
                                  ),
                                ),
                              );
                            },
                      icon: const Icon(Icons.play_arrow),
                      label: Text(
                        curso.naoIniciado ? 'Começar curso' : 'Continuar curso',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.chatEdia,
                          arguments: curso.titulo,
                        );
                      },
                      icon: const Icon(Icons.auto_awesome),
                      label: const Text('Perguntar à EdIA sobre este curso'),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Módulos',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...curso.modulos.map(
                    (modulo) => _ModuloExpansionTile(modulo: modulo),
                  ),
                ],
              ),
            ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String texto;

  const _TagChip({required this.texto});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.3)),
      ),
      child: Text(
        texto,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ModuloExpansionTile extends StatelessWidget {
  final Modulo modulo;

  const _ModuloExpansionTile({required this.modulo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.divisorClaro),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(
          modulo.titulo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          '${modulo.aulasConcluidas}/${modulo.aulas.length} aulas concluídas',
        ),
        children: modulo.aulas
            .map((aula) => _AulaListItem(aula: aula))
            .toList(),
      ),
    );
  }
}

class _AulaListItem extends StatelessWidget {
  final Aula aula;

  const _AulaListItem({required this.aula});

  IconData get _iconePorTipo {
    switch (aula.tipo) {
      case TipoAula.video:
        return Icons.play_circle_outline;
      case TipoAula.leitura:
        return Icons.article_outlined;
      case TipoAula.quiz:
        return Icons.quiz_outlined;
      case TipoAula.aoVivo:
        return Icons.sensors;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        aula.concluida ? Icons.check_circle : _iconePorTipo,
        color: aula.concluida ? AppColors.sucesso : colorScheme.primary,
      ),
      title: Text(
        aula.titulo,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: aula.concluida ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text('${aula.tipo.label} • ${aula.duracaoFormatada}'),
    );
  }
}
