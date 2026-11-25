// Testul verifică faptul că ecranul Home afișează datele citite din
// assets/data/lab_v4.json prin AppController (GetX).

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:lab111/main.dart';

void main() {
  tearDown(Get.reset);

  testWidgets('Home is the opening screen with data from JSON', (tester) async {
    await tester.pumpWidget(const LearningApp());
    // Așteaptă încărcarea JSON-ului din assets
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
    await tester.pump();

    expect(find.text('Hi, Kristin'), findsOneWidget);
    expect(find.text('Learning Plan'), findsOneWidget);
    expect(find.text('Packaging Design'), findsOneWidget);
  });
}
