import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';
import '../components/app_top_bar.dart';
import 'cursos_screen.dart';
import 'inicio_screen.dart';
import 'perfil_screen.dart';
import 'salas_screen.dart';

/// Casca da Home do EducaMais: quatro abas preservando estado via
/// [IndexedStack], barra superior com titulo por aba e acao de info, e
/// o botao flutuante para abrir o chat da EdIA.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _abaSelecionada = 0;

  static const List<String> _titulosPorAba = [
    'Início',
    'Cursos',
    'Salas de Estudo',
    'Perfil',
  ];

  static const List<Widget> _telasPorAba = [
    InicioScreen(),
    CursosScreen(),
    SalasScreen(),
    PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        titulo: _titulosPorAba[_abaSelecionada],
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre o EducaMais',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.sobre);
            },
          ),
        ],
      ),
      body: IndexedStack(index: _abaSelecionada, children: _telasPorAba),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.chatEdia);
        },
        icon: const Icon(Icons.auto_awesome),
        label: const Text('EdIA'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _abaSelecionada,
        onDestinationSelected: (indice) {
          setState(() {
            _abaSelecionada = indice;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Cursos',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: 'Salas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
