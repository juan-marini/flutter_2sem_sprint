import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../components/app_logo.dart';
import '../components/app_top_bar.dart';

/// Tela Sobre o EducaMais: marca, os quatro pilares e o escopo desta
/// Sprint.
class SobreScreen extends StatelessWidget {
  final VoidCallback onBackClick;

  const SobreScreen({super.key, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(titulo: 'Sobre o EducaMais', onBackClick: onBackClick),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 24,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.navy, AppColors.azulEletrico],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                child: AppLogo(mostrarTagline: true, tamanhoMarca: 64),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Os quatro pilares',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ..._pilares.map((pilar) => _PilarTile(pilar: pilar)),
                  const SizedBox(height: 8),
                  Text(
                    'Escopo desta Sprint',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Esta versão apresenta a navegação completa do '
                    'EducaMais com dados mockados em memória: cursos, '
                    'salas de estudo, alertas preditivos e as respostas '
                    'da EdIA. Não há integração com backend, banco de '
                    'dados ou serviços externos — o foco desta Sprint é '
                    'a experiência de navegação e a interface.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pilar {
  final IconData icone;
  final String titulo;
  final String descricao;

  const _Pilar({
    required this.icone,
    required this.titulo,
    required this.descricao,
  });
}

const List<_Pilar> _pilares = [
  _Pilar(
    icone: Icons.trending_down,
    titulo: 'Preditiva de evasão',
    descricao:
        'Cruza acessos, notas e ritmo de estudo para avisar antes do '
        'abandono, sempre com uma ação sugerida junto do alerta.',
  ),
  _Pilar(
    icone: Icons.auto_awesome,
    titulo: 'EdIA em chat',
    descricao:
        'Assistente com busca no material da empresa. Toda resposta '
        'mostra a fonte; sem fonte, ela prefere não responder.',
  ),
  _Pilar(
    icone: Icons.groups,
    titulo: 'Salas de Estudo',
    descricao:
        'Encontros síncronos e curtos, mediados por quem já domina o '
        'conteúdo.',
  ),
  _Pilar(
    icone: Icons.hub_outlined,
    titulo: 'Multicanal',
    descricao:
        'O mesmo conteúdo em app, modo áudio e WhatsApp — nesta Sprint, '
        'representado apenas na interface.',
  ),
];

class _PilarTile extends StatelessWidget {
  final _Pilar pilar;

  const _PilarTile({required this.pilar});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: colorScheme.primary.withValues(alpha: 0.12),
            child: Icon(pilar.icone, color: colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pilar.titulo,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  pilar.descricao,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
