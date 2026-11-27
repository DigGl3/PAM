import '../../core/error/result.dart';
import '../entities/course_details.dart';
import '../repositories/learning_repository.dart';

/// Use case: obține detaliile cursului pentru ecranul Course Overview.
class GetCourseDetails {
  const GetCourseDetails(this._repository);

  final LearningRepository _repository;

  Future<Result<CourseDetails>> call() => _repository.getCourseDetails();
}
