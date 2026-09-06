import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';
import '../../theme/app_colors.dart';
import '../components/app_logo.dart';

/// Tela de login do EducaMais: fundo com gradiente navy, marca, campos
/// de matricula e senha com validacao local, alternancia de visibilidade
/// da senha e indicador de carregamento no botao.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _senhaVisivel = false;
  bool _carregando = false;
  String? _erroMatricula;
  String? _erroSenha;

  @override
  void dispose() {
    _matriculaController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _entrar() async {
    final matricula = _matriculaController.text.trim();
    final senha = _senhaController.text;

    String? erroMatricula;
    String? erroSenha;

    if (matricula.isEmpty) {
      erroMatricula = 'Informe sua matrícula';
    }

    if (senha.isEmpty) {
      erroSenha = 'Informe sua senha';
    } else if (senha.length < 4) {
      erroSenha = 'A senha deve ter pelo menos 4 caracteres';
    }

    setState(() {
      _erroMatricula = erroMatricula;
      _erroSenha = erroSenha;
    });

    if (erroMatricula != null || erroSenha != null) {
      return;
    }

    setState(() {
      _carregando = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  InputDecoration _decoracaoCampo({
    required String rotulo,
    required String? erro,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: rotulo,
      errorText: erro,
      filled: true,
      fillColor: AppColors.superficieClara.withValues(alpha: 0.08),
      labelStyle: TextStyle(
        color: AppColors.superficieClara.withValues(alpha: 0.85),
      ),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: AppColors.superficieClara.withValues(alpha: 0.24),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.ciano, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.risco),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.risco, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.navy, AppColors.azulEletrico],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppLogo(mostrarTagline: true, tamanhoMarca: 72),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _matriculaController,
                    style: const TextStyle(color: AppColors.superficieClara),
                    decoration: _decoracaoCampo(
                      rotulo: 'Matrícula',
                      erro: _erroMatricula,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _senhaController,
                    obscureText: !_senhaVisivel,
                    style: const TextStyle(color: AppColors.superficieClara),
                    decoration: _decoracaoCampo(
                      rotulo: 'Senha',
                      erro: _erroSenha,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaVisivel
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.superficieClara.withValues(
                            alpha: 0.85,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _senhaVisivel = !_senhaVisivel;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _carregando ? null : _entrar,
                      child: _carregando
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            )
                          : const Text('Entrar'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.sobre);
                    },
                    child: Text(
                      'O que é o EducaMais?',
                      style: TextStyle(
                        color: AppColors.superficieClara.withValues(
                          alpha: 0.85,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
