import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Marca do EducaMais, desenhada com [Container] + [Icon] + gradiente
/// (sem depender de nenhum arquivo de imagem).
///
/// Usada sobre fundos escuros ou com gradiente (login e cabeçalho do
/// Sobre), por isso o texto e o icone sao sempre brancos.
class AppLogo extends StatelessWidget {
  final bool mostrarTagline;
  final double tamanhoMarca;

  const AppLogo({
    super.key,
    this.mostrarTagline = false,
    this.tamanhoMarca = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: tamanhoMarca,
          height: tamanhoMarca,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.azulEletrico, AppColors.ciano],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(tamanhoMarca * 0.28),
          ),
          child: Icon(
            Icons.auto_awesome,
            color: AppColors.superficieClara,
            size: tamanhoMarca * 0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'EducaMais',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.superficieClara,
            fontSize: 26,
          ),
        ),
        if (mostrarTagline) ...[
          const SizedBox(height: 4),
          Text(
            'EdIA — Inteligência que aprende com você',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.superficieClara.withValues(alpha: 0.75),
            ),
          ),
        ],
      ],
    );
  }
}
