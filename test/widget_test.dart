// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:lab111/main.dart';

void main() {
  testWidgets('Home is the opening screen', (tester) async {
    await tester.pumpWidget(const LearningApp());

    expect(find.text('Hi, Kristin'), findsOneWidget);
    expect(find.text('Learning Plan'), findsOneWidget);
  });
}
