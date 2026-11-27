/// Entitățile ecranului Course Overview (stratul Domain).

class CourseDetails {
  const CourseDetails({
    required this.navigation,
    required this.course,
    required this.actions,
    required this.uiIcons,
  });

  final CourseNavigation navigation;
  final Course course;
  final CourseActions actions;
  final UiIcons uiIcons;
}

class CourseNavigation {
  const CourseNavigation({required this.title, required this.backIconUrl});

  final String title;
  final String backIconUrl;
}

class Course {
  const Course({
    required this.id,
    required this.title,
    required this.duration,
    required this.durationMinutes,
    required this.lessonCount,
    required this.rating,
    required this.hero,
    required this.tabs,
    required this.lessons,
    required this.description,
  });

  final String id;
  final String title;
  final String duration;
  final int durationMinutes;
  final int lessonCount;
  final double rating;
  final CourseHero hero;
  final CourseTabs tabs;
  final List<Lesson> lessons;
  final String description;

  /// Prima lecție deblocată și neterminată (cea „curentă”), sau -1.
  int get currentLessonIndex =>
      lessons.indexWhere((l) => !l.locked && !l.completed);
}

class CourseHero {
  const CourseHero({
    required this.label,
    required this.imageUrl,
    required this.playIconUrl,
    required this.videoCount,
    required this.classCount,
  });

  final String label;
  final String imageUrl;
  final String playIconUrl;
  final int videoCount;
  final int classCount;
}

class CourseTabs {
  const CourseTabs({required this.selected, required this.items});

  final String selected;
  final List<CourseTab> items;
}

class CourseTab {
  const CourseTab({
    required this.id,
    required this.label,
    required this.selected,
  });

  final String id;
  final String label;
  final bool selected;
}

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.durationSeconds,
    required this.completed,
    required this.locked,
    required this.playIconUrl,
    required this.arrowIconUrl,
  });

  final String id;
  final String title;
  final String duration;
  final int durationSeconds;
  final bool completed;
  final bool locked;
  final String playIconUrl;
  final String arrowIconUrl;
}

class CourseActions {
  const CourseActions({required this.price, required this.enroll});

  final Price price;
  final EnrollAction enroll;
}

class Price {
  const Price({
    required this.label,
    required this.amount,
    required this.currency,
  });

  final String label;
  final double amount;
  final String currency;
}

class EnrollAction {
  const EnrollAction({required this.label, required this.enabled});

  final String label;
  final bool enabled;
}

class UiIcons {
  const UiIcons({
    required this.durationIconUrl,
    required this.lessonsIconUrl,
    required this.ratingIconUrl,
  });

  final String durationIconUrl;
  final String lessonsIconUrl;
  final String ratingIconUrl;
}
