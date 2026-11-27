import '../../domain/entities/feed.dart';
import 'json_utils.dart';

/// Modelele din stratul Data: extind entitățile din Domain și adaugă
/// serializarea JSON (fromJson = deserializare, toJson = serializare).
/// Răspuns: GET /feed

class FeedModel extends Feed {
  const FeedModel({
    required HeaderModel super.header,
    required LearnedTodayModel super.learnedToday,
    required MyCoursesModel super.myCourses,
    required LearningPromptModel super.learningPrompt,
    required LearningPlanModel super.learningPlan,
    required MeetupModel super.meetup,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        header: HeaderModel.fromJson(readMap(json['header'])),
        learnedToday: LearnedTodayModel.fromJson(readMap(json['learnedToday'])),
        myCourses: MyCoursesModel.fromJson(readMap(json['myCourses'])),
        learningPrompt:
            LearningPromptModel.fromJson(readMap(json['learningPrompt'])),
        learningPlan: LearningPlanModel.fromJson(readMap(json['learningPlan'])),
        meetup: MeetupModel.fromJson(readMap(json['meetup'])),
      );

  Map<String, dynamic> toJson() => {
        'header': (header as HeaderModel).toJson(),
        'learnedToday': (learnedToday as LearnedTodayModel).toJson(),
        'myCourses': (myCourses as MyCoursesModel).toJson(),
        'learningPrompt': (learningPrompt as LearningPromptModel).toJson(),
        'learningPlan': (learningPlan as LearningPlanModel).toJson(),
        'meetup': (meetup as MeetupModel).toJson(),
      };
}

class HeaderModel extends Header {
  const HeaderModel({
    required super.greeting,
    required super.subtitle,
    required super.avatarUrl,
    required NotificationInfoModel super.notification,
  });

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
        greeting: readString(json['greeting']),
        subtitle: readString(json['subtitle']),
        avatarUrl: readString(json['avatarUrl']),
        notification:
            NotificationInfoModel.fromJson(readMap(json['notification'])),
      );

  Map<String, dynamic> toJson() => {
        'greeting': greeting,
        'subtitle': subtitle,
        'avatarUrl': avatarUrl,
        'notification': (notification as NotificationInfoModel).toJson(),
      };
}

class NotificationInfoModel extends NotificationInfo {
  const NotificationInfoModel({required super.hasUnread, required super.iconUrl});

  factory NotificationInfoModel.fromJson(Map<String, dynamic> json) =>
      NotificationInfoModel(
        hasUnread: readBool(json['hasUnread']),
        iconUrl: readString(json['iconUrl']),
      );

  Map<String, dynamic> toJson() => {'hasUnread': hasUnread, 'iconUrl': iconUrl};
}

class LearnedTodayModel extends LearnedToday {
  const LearnedTodayModel({
    required super.title,
    required super.learnedMinutes,
    required super.goalMinutes,
    required super.formatted,
    required super.progress,
  });

  factory LearnedTodayModel.fromJson(Map<String, dynamic> json) =>
      LearnedTodayModel(
        title: readString(json['title']),
        learnedMinutes: readInt(json['learnedMinutes']),
        goalMinutes: readInt(json['goalMinutes']),
        formatted: readString(json['formatted']),
        progress: readDouble(json['progress']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'learnedMinutes': learnedMinutes,
        'goalMinutes': goalMinutes,
        'formatted': formatted,
        'progress': progress,
      };
}

class MyCoursesModel extends MyCourses {
  const MyCoursesModel({required super.title, required super.actionLabel});

  factory MyCoursesModel.fromJson(Map<String, dynamic> json) => MyCoursesModel(
        title: readString(json['title']),
        actionLabel: readString(json['actionLabel']),
      );

  Map<String, dynamic> toJson() => {'title': title, 'actionLabel': actionLabel};
}

class LearningPromptModel extends LearningPrompt {
  const LearningPromptModel({
    required super.title,
    required super.actionLabel,
    required super.imageUrl,
  });

  factory LearningPromptModel.fromJson(Map<String, dynamic> json) =>
      LearningPromptModel(
        title: readString(json['title']),
        actionLabel: readString(json['actionLabel']),
        imageUrl: readString(json['imageUrl']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'actionLabel': actionLabel,
        'imageUrl': imageUrl,
      };
}

class LearningPlanModel extends LearningPlan {
  const LearningPlanModel({
    required super.title,
    required List<LearningPlanItemModel> super.items,
  });

  factory LearningPlanModel.fromJson(Map<String, dynamic> json) =>
      LearningPlanModel(
        title: readString(json['title']),
        items: readList(json['items'])
            .map(LearningPlanItemModel.fromJson)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'items':
            items.map((e) => (e as LearningPlanItemModel).toJson()).toList(),
      };
}

class LearningPlanItemModel extends LearningPlanItem {
  const LearningPlanItemModel({
    required super.id,
    required super.title,
    required super.completed,
    required super.total,
    required super.progress,
    required super.progressIconUrl,
  });

  factory LearningPlanItemModel.fromJson(Map<String, dynamic> json) =>
      LearningPlanItemModel(
        id: readString(json['id']),
        title: readString(json['title']),
        completed: readInt(json['completed']),
        total: readInt(json['total']),
        progress: readDouble(json['progress']),
        progressIconUrl: readString(json['progressIconUrl']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'completed': completed,
        'total': total,
        'progress': progress,
        'progressIconUrl': progressIconUrl,
      };
}

class MeetupModel extends Meetup {
  const MeetupModel({
    required super.title,
    required super.subtitle,
    required super.imageUrl,
  });

  factory MeetupModel.fromJson(Map<String, dynamic> json) => MeetupModel(
        title: readString(json['title']),
        subtitle: readString(json['subtitle']),
        imageUrl: readString(json['imageUrl']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'imageUrl': imageUrl,
      };
}
