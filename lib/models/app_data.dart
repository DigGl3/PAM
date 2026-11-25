// Modele pentru datele din assets/data/lab_v4.json

class AppData {
  final HomePageData homePage;
  final CourseOverviewPageData courseOverviewPage;

  AppData({required this.homePage, required this.courseOverviewPage});

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
        homePage: HomePageData.fromJson(json['homePage']),
        courseOverviewPage:
            CourseOverviewPageData.fromJson(json['courseOverviewPage']),
      );
}

// ---------------------------------------------------------------- Home page

class HomePageData {
  final HeaderData header;
  final LearnedTodayData learnedToday;
  final MyCoursesData myCourses;
  final LearningPromptData learningPrompt;
  final LearningPlanData learningPlan;
  final MeetupData meetup;

  HomePageData({
    required this.header,
    required this.learnedToday,
    required this.myCourses,
    required this.learningPrompt,
    required this.learningPlan,
    required this.meetup,
  });

  factory HomePageData.fromJson(Map<String, dynamic> json) => HomePageData(
        header: HeaderData.fromJson(json['header']),
        learnedToday: LearnedTodayData.fromJson(json['learnedToday']),
        myCourses: MyCoursesData.fromJson(json['myCourses']),
        learningPrompt: LearningPromptData.fromJson(json['learningPrompt']),
        learningPlan: LearningPlanData.fromJson(json['learningPlan']),
        meetup: MeetupData.fromJson(json['meetup']),
      );
}

class HeaderData {
  final String greeting;
  final String subtitle;
  final String avatarUrl;
  final bool hasUnreadNotification;
  final String notificationIconUrl;

  HeaderData({
    required this.greeting,
    required this.subtitle,
    required this.avatarUrl,
    required this.hasUnreadNotification,
    required this.notificationIconUrl,
  });

  factory HeaderData.fromJson(Map<String, dynamic> json) => HeaderData(
        greeting: json['greeting'] ?? '',
        subtitle: json['subtitle'] ?? '',
        avatarUrl: json['avatarUrl'] ?? '',
        hasUnreadNotification: json['notification']?['hasUnread'] ?? false,
        notificationIconUrl: json['notification']?['iconUrl'] ?? '',
      );
}

class LearnedTodayData {
  final String title;
  final int learnedMinutes;
  final int goalMinutes;
  final double progress;

  LearnedTodayData({
    required this.title,
    required this.learnedMinutes,
    required this.goalMinutes,
    required this.progress,
  });

  factory LearnedTodayData.fromJson(Map<String, dynamic> json) =>
      LearnedTodayData(
        title: json['title'] ?? '',
        learnedMinutes: (json['learnedMinutes'] as num?)?.toInt() ?? 0,
        goalMinutes: (json['goalMinutes'] as num?)?.toInt() ?? 0,
        progress: (json['progress'] as num?)?.toDouble() ?? 0,
      );
}

class MyCoursesData {
  final String title;
  final String actionLabel;

  MyCoursesData({required this.title, required this.actionLabel});

  factory MyCoursesData.fromJson(Map<String, dynamic> json) => MyCoursesData(
        title: json['title'] ?? '',
        actionLabel: json['actionLabel'] ?? '',
      );
}

class LearningPromptData {
  final String title;
  final String actionLabel;
  final String imageUrl;

  LearningPromptData({
    required this.title,
    required this.actionLabel,
    required this.imageUrl,
  });

  factory LearningPromptData.fromJson(Map<String, dynamic> json) =>
      LearningPromptData(
        title: json['title'] ?? '',
        actionLabel: json['actionLabel'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
      );
}

class LearningPlanData {
  final String title;
  final List<LearningPlanItem> items;

  LearningPlanData({required this.title, required this.items});

  factory LearningPlanData.fromJson(Map<String, dynamic> json) =>
      LearningPlanData(
        title: json['title'] ?? '',
        items: (json['items'] as List? ?? [])
            .map((e) => LearningPlanItem.fromJson(e))
            .toList(),
      );
}

class LearningPlanItem {
  final String id;
  final String title;
  final int completed;
  final int total;
  final double progress;
  final String progressIconUrl;

  LearningPlanItem({
    required this.id,
    required this.title,
    required this.completed,
    required this.total,
    required this.progress,
    required this.progressIconUrl,
  });

  factory LearningPlanItem.fromJson(Map<String, dynamic> json) =>
      LearningPlanItem(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        completed: (json['completed'] as num?)?.toInt() ?? 0,
        total: (json['total'] as num?)?.toInt() ?? 0,
        progress: (json['progress'] as num?)?.toDouble() ?? 0,
        progressIconUrl: json['progressIconUrl'] ?? '',
      );
}

class MeetupData {
  final String title;
  final String subtitle;
  final String imageUrl;

  MeetupData({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  factory MeetupData.fromJson(Map<String, dynamic> json) => MeetupData(
        title: json['title'] ?? '',
        subtitle: json['subtitle'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
      );
}

// ------------------------------------------------------ Course overview page

class CourseOverviewPageData {
  final String navigationTitle;
  final String backIconUrl;
  final CourseData course;
  final ActionsData actions;
  final UiIconsData uiIcons;

  CourseOverviewPageData({
    required this.navigationTitle,
    required this.backIconUrl,
    required this.course,
    required this.actions,
    required this.uiIcons,
  });

  factory CourseOverviewPageData.fromJson(Map<String, dynamic> json) =>
      CourseOverviewPageData(
        navigationTitle: json['navigation']?['title'] ?? '',
        backIconUrl: json['navigation']?['backIconUrl'] ?? '',
        course: CourseData.fromJson(json['course']),
        actions: ActionsData.fromJson(json['actions']),
        uiIcons: UiIconsData.fromJson(json['uiIcons'] ?? {}),
      );
}

class CourseData {
  final String id;
  final String title;
  final String duration;
  final int lessonCount;
  final double rating;
  final String heroLabel;
  final String heroImageUrl;
  final String heroPlayIconUrl;
  final String selectedTab;
  final List<TabData> tabs;
  final List<LessonData> lessons;
  final String description;

  CourseData({
    required this.id,
    required this.title,
    required this.duration,
    required this.lessonCount,
    required this.rating,
    required this.heroLabel,
    required this.heroImageUrl,
    required this.heroPlayIconUrl,
    required this.selectedTab,
    required this.tabs,
    required this.lessons,
    required this.description,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        duration: json['duration'] ?? '',
        lessonCount: (json['lessonCount'] as num?)?.toInt() ?? 0,
        rating: (json['rating'] as num?)?.toDouble() ?? 0,
        heroLabel: json['hero']?['label'] ?? '',
        heroImageUrl: json['hero']?['imageUrl'] ?? '',
        heroPlayIconUrl: json['hero']?['playIconUrl'] ?? '',
        selectedTab: json['tabs']?['selected'] ?? '',
        tabs: (json['tabs']?['items'] as List? ?? [])
            .map((e) => TabData.fromJson(e))
            .toList(),
        lessons: (json['lessons'] as List? ?? [])
            .map((e) => LessonData.fromJson(e))
            .toList(),
        description: json['description']?['text'] ?? '',
      );
}

class TabData {
  final String id;
  final String label;

  TabData({required this.id, required this.label});

  factory TabData.fromJson(Map<String, dynamic> json) =>
      TabData(id: json['id'] ?? '', label: json['label'] ?? '');
}

class LessonData {
  final String id;
  final String title;
  final String duration;
  final bool completed;
  final bool locked;
  final String playIconUrl;
  final String arrowIconUrl;

  LessonData({
    required this.id,
    required this.title,
    required this.duration,
    required this.completed,
    required this.locked,
    required this.playIconUrl,
    required this.arrowIconUrl,
  });

  factory LessonData.fromJson(Map<String, dynamic> json) => LessonData(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        duration: json['duration'] ?? '',
        completed: json['completed'] ?? false,
        locked: json['locked'] ?? false,
        playIconUrl: json['playIconUrl'] ?? '',
        arrowIconUrl: json['arrowIconUrl'] ?? '',
      );
}

class ActionsData {
  final String priceLabel;
  final String enrollLabel;
  final bool enrollEnabled;

  ActionsData({
    required this.priceLabel,
    required this.enrollLabel,
    required this.enrollEnabled,
  });

  factory ActionsData.fromJson(Map<String, dynamic> json) => ActionsData(
        priceLabel: json['price']?['label'] ?? '',
        enrollLabel: json['enroll']?['label'] ?? '',
        enrollEnabled: json['enroll']?['enabled'] ?? false,
      );
}

class UiIconsData {
  final String durationIconUrl;
  final String lessonsIconUrl;
  final String ratingIconUrl;

  UiIconsData({
    required this.durationIconUrl,
    required this.lessonsIconUrl,
    required this.ratingIconUrl,
  });

  factory UiIconsData.fromJson(Map<String, dynamic> json) => UiIconsData(
        durationIconUrl: json['durationIconUrl'] ?? '',
        lessonsIconUrl: json['lessonsIconUrl'] ?? '',
        ratingIconUrl: json['ratingIconUrl'] ?? '',
      );
}
