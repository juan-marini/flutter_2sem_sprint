import 'package:flutter/material.dart';

import '../../model/sala_estudo.dart';
import '../components/app_top_bar.dart';

/// Detalhe de uma Sala de Estudo. Recebe a [SalaEstudo] selecionada pela
/// lista por meio dos argumentos da rota — por isso [sala] e sempre
/// nullable e a tela trata o caso nulo com um estado vazio em vez de
/// quebrar.
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
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    sala.titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Detalhe da sala — em construção',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Confirmar participação'),
                  ),
                ],
              ),
            ),
    );
  }
}
