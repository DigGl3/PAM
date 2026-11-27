// Teste unitare pentru serializarea / deserializarea JSON.

import 'package:flutter_test/flutter_test.dart';
import 'package:lab111/data/models/course_details_model.dart';
import 'package:lab111/data/models/feed_model.dart';

import 'fixtures.dart';

void main() {
  test('FeedModel.fromJson citește toate câmpurile', () {
    final feed = FeedModel.fromJson(feedJson);

    expect(feed.header.greeting, 'Hi, Kristin');
    expect(feed.header.notification.hasUnread, isTrue);
    expect(feed.learnedToday.learnedMinutes, 46);
    expect(feed.learningPlan.items, hasLength(2));
    expect(feed.learningPlan.items.first.title, 'Packaging Design');
  });

  test('FeedModel toJson -> fromJson păstrează datele', () {
    final feed = FeedModel.fromJson(feedJson);
    final again = FeedModel.fromJson(feed.toJson());

    expect(again.meetup.subtitle, feed.meetup.subtitle);
    expect(again.learningPlan.items.last.total, 24);
  });

  test('CourseDetailsModel.fromJson citește lecțiile', () {
    final details = CourseDetailsModel.fromJson(detailsJson);

    expect(details.course.title, 'React Front To back');
    expect(details.course.lessons, hasLength(2));
    expect(details.course.lessons.last.locked, isTrue);
    expect(details.course.currentLessonIndex, 0);
    expect(details.actions.enroll.label, 'Enroll Now');
  });

  test('câmpurile lipsă primesc valori implicite, fără crash', () {
    final feed = FeedModel.fromJson(const {});
    expect(feed.header.greeting, '');
    expect(feed.learningPlan.items, isEmpty);
  });
}
