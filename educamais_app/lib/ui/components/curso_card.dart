import 'package:flutter/material.dart';

import '../../model/curso.dart';
import '../../theme/app_colors.dart';
import 'risco_badge.dart';

/// Cartao de curso usado na lista horizontal "Continue de onde parou"
/// (aba Inicio) e na lista vertical da aba Cursos.
///
/// Em listas horizontais, a tela deve envolver o cartao em um
/// [SizedBox] de largura fixa.
class CursoCard extends StatelessWidget {
  final Curso curso;
  final VoidCallback? onTap;

  const CursoCard({super.key, required this.curso, this.onTap});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      curso.categoria.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  RiscoBadge(risco: curso.risco),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                curso.titulo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                curso.instrutor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: LinearProgressIndicator(
                  value: curso.progresso.clamp(0, 1).toDouble(),
                  minHeight: 6,
                  backgroundColor: AppColors.divisorClaro,
                  valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${curso.percentual}% concluído',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${curso.cargaHoraria}h',
                    style: Theme.of(context).textTheme.bodySmall,
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
