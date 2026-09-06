import 'package:flutter/material.dart';

import '../../model/sala_estudo.dart';
import '../../theme/app_colors.dart';
import '../components/app_top_bar.dart';

/// Detalhe de uma Sala de Estudo. Recebe a [SalaEstudo] selecionada pela
/// lista por meio dos argumentos da rota — por isso [sala] e sempre
/// nullable e a tela trata o caso nulo com um estado vazio em vez de
/// quebrar. O botao de confirmar participacao devolve `true` para quem
/// chamou a rota, via `Navigator.pop(context, true)`.
class SalaDetalheScreen extends StatelessWidget {
  final SalaEstudo? sala;
  final VoidCallback onBackClick;

  const SalaDetalheScreen({
    super.key,
    required this.sala,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    final sala = this.sala;
    return Scaffold(
      appBar: AppTopBar(
        titulo: sala?.titulo ?? 'Sala de Estudo',
        onBackClick: onBackClick,
      ),
      body: sala == null
          ? const Center(child: Text('Nenhuma sala selecionada.'))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (sala.aoVivo)
                        const _EtiquetaDestaque(
                          texto: 'AO VIVO',
                          cor: AppColors.risco,
                        ),
                      if (sala.lotada)
                        const _EtiquetaDestaque(
                          texto: 'LOTADA',
                          cor: AppColors.atencao,
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    sala.titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sala.cursoRelacionado,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    sala.descricao,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.person_outline, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text('Mediado por ${sala.mediador}')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 18),
                      const SizedBox(width: 8),
                      Text(sala.horario),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.groups_outlined, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        '${sala.participantes}/${sala.capacidade} '
                        'participantes',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: sala.ocupacao.clamp(0, 1).toDouble(),
                      minHeight: 6,
                      backgroundColor: AppColors.divisorClaro,
                      valueColor: AlwaysStoppedAnimation(
                        sala.lotada
                            ? AppColors.atencao
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: sala.lotada
                          ? null
                          : () {
                              Navigator.pop(context, true);
                            },
                      child: Text(
                        sala.lotada ? 'Sala lotada' : 'Confirmar participação',
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _EtiquetaDestaque extends StatelessWidget {
  final String texto;
  final Color cor;

  const _EtiquetaDestaque({required this.texto, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        texto,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: cor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
