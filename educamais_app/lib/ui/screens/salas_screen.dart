import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';
import '../../repository/sala_repository.dart';
import '../components/sala_card.dart';

/// Aba Salas: lista das Salas de Estudo, com indicação de ao vivo,
/// ocupação e lotação.
class SalasScreen extends StatelessWidget {
  const SalasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final salas = getAllSalas();

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 96),
      itemCount: salas.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final sala = salas[index];
        return SalaCard(
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
        );
      },
    );
  }
}
