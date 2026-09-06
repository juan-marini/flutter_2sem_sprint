import 'package:flutter/material.dart';

import '../model/curso.dart';
import '../model/sala_estudo.dart';
import '../ui/screens/chat_edia_screen.dart';
import '../ui/screens/curso_detalhe_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/sala_detalhe_screen.dart';
import '../ui/screens/sobre_screen.dart';
import 'app_routes.dart';

/// Gera as rotas do EducaMais a partir do nome e dos argumentos da
/// [RouteSettings]. Nenhuma tela usa `Navigator.push` com
/// `MaterialPageRoute` direto — tudo passa por aqui.
class AppNavigation {
  AppNavigation._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case AppRoutes.cursoDetalhe:
        final curso = settings.arguments as Curso?;
        return MaterialPageRoute(
          builder: (context) => CursoDetalheScreen(
            curso: curso,
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.salaDetalhe:
        final sala = settings.arguments as SalaEstudo?;
        return MaterialPageRoute(
          builder: (context) => SalaDetalheScreen(
            sala: sala,
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.chatEdia:
        final cursoTitulo = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => ChatEdiaScreen(
            cursoTitulo: cursoTitulo,
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.sobre:
        return MaterialPageRoute(
          builder: (context) => SobreScreen(
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.login:
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
