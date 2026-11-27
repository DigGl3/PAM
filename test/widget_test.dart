// Testează ecranul Home cu un repository fals (fără internet).
// Datorită Clean Architecture, putem înlocui stratul Data fără să
// modificăm nimic în Presentation.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lab111/core/error/failures.dart';
import 'package:lab111/core/error/result.dart';
import 'package:lab111/data/models/course_details_model.dart';
import 'package:lab111/data/models/feed_model.dart';
import 'package:lab111/domain/entities/course_details.dart';
import 'package:lab111/domain/entities/feed.dart';
import 'package:lab111/domain/repositories/learning_repository.dart';
import 'package:lab111/domain/usecases/get_feed.dart';
import 'package:lab111/presentation/controllers/home_controller.dart';
import 'package:lab111/presentation/pages/home_page.dart';

import 'fixtures.dart';

class FakeRepository implements LearningRepository {
  FakeRepository({this.fail = false});
  final bool fail;

  @override
  Future<Result<Feed>> getFeed() async => fail
      ? const Failed(NetworkFailure('Fără internet'))
      : Success(FeedModel.fromJson(feedJson));

  @override
  Future<Result<CourseDetails>> getCourseDetails() async =>
      Success(CourseDetailsModel.fromJson(detailsJson));
}

Future<void> pumpHome(WidgetTester tester, LearningRepository repo) async {
  Get.put(HomeController(GetFeed(repo)));
  await tester.pumpWidget(const GetMaterialApp(home: HomePage()));
  await tester.pump();
}

void main() {
  tearDown(Get.reset);

  testWidgets('Home afișează datele primite', (tester) async {
    await pumpHome(tester, FakeRepository());

    expect(find.text('Hi, Kristin'), findsOneWidget);
    expect(find.text('Learning Plan'), findsOneWidget);
    expect(find.text('Packaging Design'), findsOneWidget);
  });

  testWidgets('Home afișează eroarea și butonul Reîncearcă', (tester) async {
    await pumpHome(tester, FakeRepository(fail: true));

    expect(find.text('Fără internet'), findsOneWidget);
    expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
  });
}
