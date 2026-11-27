import '../../core/error/result.dart';
import '../entities/course_details.dart';
import '../entities/feed.dart';

/// Contractul (interfața) repository-ului, definit în Domain.
/// Implementarea concretă stă în stratul Data, astfel Domain nu depinde
/// de HTTP, JSON sau de vreun pachet extern.
abstract interface class LearningRepository {
  Future<Result<Feed>> getFeed();

  Future<Result<CourseDetails>> getCourseDetails();
}
