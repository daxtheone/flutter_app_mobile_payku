// Smoke test básico de la app.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:payku_mobile/main.dart';

void main() {
  testWidgets('La app arranca en la pantalla inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Prueba Screem 1'), findsOneWidget);
  });
}