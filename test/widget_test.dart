import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ordem_servico/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Remova a palavra-chave 'const' aqui

    // Verifique se o contador começa em 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Toque no ícone '+' e acione um frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifique se o contador foi incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
