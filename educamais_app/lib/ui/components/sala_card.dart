import 'package:flutter/material.dart';

import '../../model/sala_estudo.dart';
import '../../theme/app_colors.dart';

/// Cartao de Sala de Estudo usado no bloco "Salas de hoje" (aba Inicio)
/// e na lista da aba Salas.
class SalaCard extends StatelessWidget {
  final SalaEstudo sala;
  final VoidCallback? onTap;

  const SalaCard({super.key, required this.sala, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divisorClaro),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      sala.titulo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (sala.aoVivo) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.risco.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'AO VIVO',
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(
                              color: AppColors.risco,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Text(
                sala.cursoRelacionado,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: colorScheme.primary),
              ),
              const SizedBox(height: 8),
              Text(
                '${sala.mediador} • ${sala.horario}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${sala.participantes}/${sala.capacidade} participantes',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (sala.lotada)
                    Text(
                      'Lotada',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.atencao,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  else
                    Text(
                      '${sala.vagasRestantes} vagas',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.sucesso,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
