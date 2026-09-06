import 'package:flutter/material.dart';

import '../../model/risco_evasao.dart';
import '../../theme/app_colors.dart';

/// Selo colorido com o nivel de risco de evasao, usado no cartao de
/// curso e no cabecalho do detalhe do curso.
class RiscoBadge extends StatelessWidget {
  final RiscoEvasao risco;

  const RiscoBadge({super.key, required this.risco});

  Color get _cor {
    switch (risco) {
      case RiscoEvasao.baixo:
        return AppColors.sucesso;
      case RiscoEvasao.medio:
        return AppColors.atencao;
      case RiscoEvasao.alto:
        return AppColors.risco;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cor = _cor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: cor.withValues(alpha: 0.4)),
      ),
      child: Text(
        risco.label,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: cor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
