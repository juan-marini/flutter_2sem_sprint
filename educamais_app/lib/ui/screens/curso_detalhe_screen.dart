import 'package:flutter/material.dart';

import '../../model/curso.dart';
import '../../navigation/app_routes.dart';
import '../components/app_top_bar.dart';

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
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    curso.titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Detalhe do curso — em construção',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.chatEdia,
                        arguments: curso.titulo,
                      );
                    },
                    child: const Text('Perguntar à EdIA sobre este curso'),
                  ),
                ],
              ),
            ),
    );
  }
}
