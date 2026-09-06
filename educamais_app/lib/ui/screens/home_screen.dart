import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';
import '../../repository/curso_repository.dart';
import '../../repository/sala_repository.dart';
import '../components/app_top_bar.dart';

/// Casca da Home do EducaMais.
///
/// As quatro abas (Início, Cursos, Salas, Perfil) com NavigationBar e
/// IndexedStack entram na fase seguinte; por enquanto a tela demonstra
/// os quatro metodos de navegacao exigidos pelo criterio de navegacao.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final curso = getAllCursos().first;
    final sala = getAllSalas().first;

    return Scaffold(
      appBar: const AppTopBar(titulo: 'EducaMais'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Home — em construção',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.cursoDetalhe,
                    arguments: curso,
                  );
                },
                child: Text('Ver detalhe de "${curso.titulo}"'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  final confirmou = await Navigator.pushNamed(
                    context,
                    AppRoutes.salaDetalhe,
                    arguments: sala,
                  );
                  if (confirmou == true && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Participação confirmada em "${sala.titulo}"')),
                    );
                  }
                },
                child: Text('Ver detalhe de "${sala.titulo}"'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.chatEdia);
                },
                child: const Text('Falar com a EdIA'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
                child: const Text('Sair'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
