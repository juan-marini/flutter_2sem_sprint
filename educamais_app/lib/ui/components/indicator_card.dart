import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Cartao compacto de indicador (icone + valor + rotulo), usado nas
/// abas Inicio e Perfil.
///
/// Quando exibido lado a lado com outros [IndicatorCard] em uma [Row],
/// a tela deve envolver a linha com [IntrinsicHeight] e
/// `CrossAxisAlignment.stretch` para que todos fiquem com a mesma altura.
class IndicatorCard extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String rotulo;
  final Color? corDestaque;

  const IndicatorCard({
    super.key,
    required this.icone,
    required this.valor,
    required this.rotulo,
    this.corDestaque,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cor = corDestaque ?? colorScheme.primary;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divisorClaro),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor),
          const SizedBox(height: 12),
          Text(valor, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 2),
          Text(
            rotulo,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
