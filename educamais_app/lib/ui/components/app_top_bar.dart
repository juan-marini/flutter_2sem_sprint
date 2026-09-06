import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Barra superior padrao do EducaMais: sem sombra, com uma borda fina de
/// 1px na base no lugar de elevacao.
///
/// Quando [onBackClick] e informado, mostra uma seta de voltar que apenas
/// chama o callback recebido — quem decide o que acontece ao voltar e o
/// [AppNavigation], nunca a propria tela.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final List<Widget>? actions;
  final VoidCallback? onBackClick;

  const AppTopBar({
    super.key,
    required this.titulo,
    this.actions,
    this.onBackClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo),
      automaticallyImplyLeading: false,
      leading: onBackClick == null
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackClick,
            ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.divisorClaro),
      ),
    );
  }
}
