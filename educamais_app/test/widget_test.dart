// Teste basico de fumaca do EducaMais: garante que o app sobe com a
// rota inicial de login, roteada pelo AppNavigation.

import 'package:flutter_test/flutter_test.dart';

import 'package:educamais_app/main.dart';

void main() {
  testWidgets('EducaMaisApp abre na tela de login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const EducaMaisApp());

    expect(find.text('Entrar'), findsOneWidget);
  });
}
