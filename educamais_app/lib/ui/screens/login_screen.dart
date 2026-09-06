import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';

/// Tela de login do EducaMais.
///
/// O formulario com matricula, senha e validacao entra na fase seguinte;
/// por enquanto a tela so demonstra a navegacao para a Home e para o
/// Sobre.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'EducaMais — Login (em construção)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.sobre);
                },
                child: const Text('O que é o EducaMais?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
