/// Entitățile ecranului Home (stratul Domain).
/// Sunt clase Dart simple: nu știu nimic despre JSON, HTTP sau Flutter.

class Feed {
  const Feed({
    required this.header,
    required this.learnedToday,
    required this.myCourses,
    required this.learningPrompt,
    required this.learningPlan,
    required this.meetup,
  });

  final Header header;
  final LearnedToday learnedToday;
  final MyCourses myCourses;
  final LearningPrompt learningPrompt;
  final LearningPlan learningPlan;
  final Meetup meetup;
}

class Header {
  const Header({
    required this.greeting,
    required this.subtitle,
    required this.avatarUrl,
    required this.notification,
  });

  final String greeting;
  final String subtitle;
  final String avatarUrl;
  final NotificationInfo notification;
}

class NotificationInfo {
  const NotificationInfo({required this.hasUnread, required this.iconUrl});

  final bool hasUnread;
  final String iconUrl;
}

class LearnedToday {
  const LearnedToday({
    required this.title,
    required this.learnedMinutes,
    required this.goalMinutes,
    required this.formatted,
    required this.progress,
  });

  final String title;
  final int learnedMinutes;
  final int goalMinutes;
  final String formatted;
  final double progress;
}

class MyCourses {
  const MyCourses({required this.title, required this.actionLabel});

  final String title;
  final String actionLabel;
}

class LearningPrompt {
  const LearningPrompt({
    required this.title,
    required this.actionLabel,
    required this.imageUrl,
  });

  final String title;
  final String actionLabel;
  final String imageUrl;
}

class LearningPlan {
  const LearningPlan({required this.title, required this.items});

  final String title;
  final List<LearningPlanItem> items;
}

class LearningPlanItem {
  const LearningPlanItem({
    required this.id,
    required this.title,
    required this.completed,
    required this.total,
    required this.progress,
    required this.progressIconUrl,
  });

  final String id;
  final String title;
  final int completed;
  final int total;
  final double progress;
  final String progressIconUrl;
}

class Meetup {
  const Meetup({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}
