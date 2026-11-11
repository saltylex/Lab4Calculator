// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pasignasigna_calculator/main.dart';

void main() {
  testWidgets('Calculator adds numbers and clears inputs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Enter two numbers'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '12.5');
    await tester.enterText(find.byType(TextField).at(1), '3');
    await tester.ensureVisible(find.text('+'));
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('15.5'), findsOneWidget);
    expect(find.text('12.5 + 3.0'), findsOneWidget);

    await tester.ensureVisible(find.text('Clear'));
    await tester.tap(find.text('Clear'));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Enter two numbers'), findsOneWidget);
    for (final field in tester.widgetList<TextField>(find.byType(TextField))) {
      expect(field.controller!.text, isEmpty);
    }
  });
}
