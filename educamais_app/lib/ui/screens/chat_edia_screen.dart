import 'package:flutter/material.dart';

import '../components/app_top_bar.dart';

/// Chat da EdIA. O [cursoTitulo] e opcional: chega preenchido quando o
/// chat e aberto a partir do detalhe de um curso, e nulo quando aberto
/// pelo botao flutuante da Home.
class ChatEdiaScreen extends StatelessWidget {
  final String? cursoTitulo;
  final VoidCallback onBackClick;

  const ChatEdiaScreen({super.key, this.cursoTitulo, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    final cursoTitulo = this.cursoTitulo;
    return Scaffold(
      appBar: AppTopBar(titulo: 'EdIA', onBackClick: onBackClick),
      body: Center(
        child: Text(
          cursoTitulo == null
              ? 'Chat da EdIA — em construção'
              : 'Chat da EdIA sobre "$cursoTitulo" — em construção',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
