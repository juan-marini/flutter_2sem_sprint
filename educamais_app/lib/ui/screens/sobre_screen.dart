import 'package:flutter/material.dart';

import '../components/app_top_bar.dart';

/// Tela Sobre o EducaMais: marca, pilares e escopo da Sprint.
class SobreScreen extends StatelessWidget {
  final VoidCallback onBackClick;

  const SobreScreen({super.key, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(titulo: 'Sobre o EducaMais', onBackClick: onBackClick),
      body: const Center(child: Text('Sobre o EducaMais — em construção')),
    );
  }
}
