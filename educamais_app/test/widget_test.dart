// Teste basico de fumaca do EducaMais: garante que o app sobe e mostra
// a marca na tela inicial provisoria.

import 'package:flutter_test/flutter_test.dart';

import 'package:educamais_app/main.dart';

void main() {
  testWidgets('EducaMaisApp mostra a marca na tela inicial', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const EducaMaisApp());

    expect(find.text('EducaMais'), findsOneWidget);
  });
}
