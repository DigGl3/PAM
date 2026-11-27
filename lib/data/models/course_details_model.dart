import '../../domain/entities/course_details.dart';
import 'json_utils.dart';

/// Modelele pentru răspunsul GET /feed/details (cu fromJson / toJson).

class CourseDetailsModel extends CourseDetails {
  const CourseDetailsModel({
    required CourseNavigationModel super.navigation,
    required CourseModel super.course,
    required CourseActionsModel super.actions,
    required UiIconsModel super.uiIcons,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsModel(
        navigation: CourseNavigationModel.fromJson(readMap(json['navigation'])),
        course: CourseModel.fromJson(readMap(json['course'])),
        actions: CourseActionsModel.fromJson(readMap(json['actions'])),
        uiIcons: UiIconsModel.fromJson(readMap(json['uiIcons'])),
      );

  Map<String, dynamic> toJson() => {
        'navigation': (navigation as CourseNavigationModel).toJson(),
        'course': (course as CourseModel).toJson(),
        'actions': (actions as CourseActionsModel).toJson(),
        'uiIcons': (uiIcons as UiIconsModel).toJson(),
      };
}

class CourseNavigationModel extends CourseNavigation {
  const CourseNavigationModel({required super.title, required super.backIconUrl});

  factory CourseNavigationModel.fromJson(Map<String, dynamic> json) =>
      CourseNavigationModel(
        title: readString(json['title']),
        backIconUrl: readString(json['backIconUrl']),
      );

  Map<String, dynamic> toJson() => {'title': title, 'backIconUrl': backIconUrl};
}

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.title,
    required super.duration,
    required super.durationMinutes,
    required super.lessonCount,
    required super.rating,
    required CourseHeroModel super.hero,
    required CourseTabsModel super.tabs,
    required List<LessonModel> super.lessons,
    required super.description,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: readString(json['id']),
        title: readString(json['title']),
        duration: readString(json['duration']),
        durationMinutes: readInt(json['durationMinutes']),
        lessonCount: readInt(json['lessonCount']),
        rating: readDouble(json['rating']),
        hero: CourseHeroModel.fromJson(readMap(json['hero'])),
        tabs: CourseTabsModel.fromJson(readMap(json['tabs'])),
        lessons: readList(json['lessons']).map(LessonModel.fromJson).toList(),
        description: readString(readMap(json['description'])['text']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'duration': duration,
        'durationMinutes': durationMinutes,
        'lessonCount': lessonCount,
        'rating': rating,
        'hero': (hero as CourseHeroModel).toJson(),
        'tabs': (tabs as CourseTabsModel).toJson(),
        'lessons': lessons.map((e) => (e as LessonModel).toJson()).toList(),
        'description': {'text': description},
      };
}

class CourseHeroModel extends CourseHero {
  const CourseHeroModel({
    required super.label,
    required super.imageUrl,
    required super.playIconUrl,
    required super.videoCount,
    required super.classCount,
  });

  factory CourseHeroModel.fromJson(Map<String, dynamic> json) =>
      CourseHeroModel(
        label: readString(json['label']),
        imageUrl: readString(json['imageUrl']),
        playIconUrl: readString(json['playIconUrl']),
        videoCount: readInt(json['videoCount']),
        classCount: readInt(json['classCount']),
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'imageUrl': imageUrl,
        'playIconUrl': playIconUrl,
        'videoCount': videoCount,
        'classCount': classCount,
      };
}

class CourseTabsModel extends CourseTabs {
  const CourseTabsModel({
    required super.selected,
    required List<CourseTabModel> super.items,
  });

  factory CourseTabsModel.fromJson(Map<String, dynamic> json) =>
      CourseTabsModel(
        selected: readString(json['selected']),
        items: readList(json['items']).map(CourseTabModel.fromJson).toList(),
      );

  Map<String, dynamic> toJson() => {
        'selected': selected,
        'items': items.map((e) => (e as CourseTabModel).toJson()).toList(),
      };
}

class CourseTabModel extends CourseTab {
  const CourseTabModel({
    required super.id,
    required super.label,
    required super.selected,
  });

  factory CourseTabModel.fromJson(Map<String, dynamic> json) => CourseTabModel(
        id: readString(json['id']),
        label: readString(json['label']),
        selected: readBool(json['selected']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'selected': selected,
      };
}

class LessonModel extends Lesson {
  const LessonModel({
    required super.id,
    required super.title,
    required super.duration,
    required super.durationSeconds,
    required super.completed,
    required super.locked,
    required super.playIconUrl,
    required super.arrowIconUrl,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        id: readString(json['id']),
        title: readString(json['title']),
        duration: readString(json['duration']),
        durationSeconds: readInt(json['durationSeconds']),
        completed: readBool(json['completed']),
        locked: readBool(json['locked']),
        playIconUrl: readString(json['playIconUrl']),
        arrowIconUrl: readString(json['arrowIconUrl']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'duration': duration,
        'durationSeconds': durationSeconds,
        'completed': completed,
        'locked': locked,
        'playIconUrl': playIconUrl,
        'arrowIconUrl': arrowIconUrl,
      };
}

class CourseActionsModel extends CourseActions {
  const CourseActionsModel({
    required PriceModel super.price,
    required EnrollActionModel super.enroll,
  });

  factory CourseActionsModel.fromJson(Map<String, dynamic> json) =>
      CourseActionsModel(
        price: PriceModel.fromJson(readMap(json['price'])),
        enroll: EnrollActionModel.fromJson(readMap(json['enroll'])),
      );

  Map<String, dynamic> toJson() => {
        'price': (price as PriceModel).toJson(),
        'enroll': (enroll as EnrollActionModel).toJson(),
      };
}

class PriceModel extends Price {
  const PriceModel({
    required super.label,
    required super.amount,
    required super.currency,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        label: readString(json['label']),
        amount: readDouble(json['amount']),
        currency: readString(json['currency']),
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'amount': amount,
        'currency': currency,
      };
}

class EnrollActionModel extends EnrollAction {
  const EnrollActionModel({required super.label, required super.enabled});

  factory EnrollActionModel.fromJson(Map<String, dynamic> json) =>
      EnrollActionModel(
        label: readString(json['label']),
        enabled: readBool(json['enabled']),
      );

  Map<String, dynamic> toJson() => {'label': label, 'enabled': enabled};
}

class UiIconsModel extends UiIcons {
  const UiIconsModel({
    required super.durationIconUrl,
    required super.lessonsIconUrl,
    required super.ratingIconUrl,
  });

  factory UiIconsModel.fromJson(Map<String, dynamic> json) => UiIconsModel(
        durationIconUrl: readString(json['durationIconUrl']),
        lessonsIconUrl: readString(json['lessonsIconUrl']),
        ratingIconUrl: readString(json['ratingIconUrl']),
      );

  Map<String, dynamic> toJson() => {
        'durationIconUrl': durationIconUrl,
        'lessonsIconUrl': lessonsIconUrl,
        'ratingIconUrl': ratingIconUrl,
      };
}
