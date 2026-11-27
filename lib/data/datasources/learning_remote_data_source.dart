import '../../core/constants/api_constants.dart';
import '../../core/network/api_client.dart';
import '../models/course_details_model.dart';
import '../models/feed_model.dart';

/// Sursa de date de la distanță (serviciul Web REST).
abstract interface class LearningRemoteDataSource {
  /// GET /feed. Aruncă ServerException / NetworkException / ParsingException.
  Future<FeedModel> getFeed();

  /// GET /feed/details
  Future<CourseDetailsModel> getCourseDetails();
}

class LearningRemoteDataSourceImpl implements LearningRemoteDataSource {
  const LearningRemoteDataSourceImpl(this._api);

  final ApiClient _api;

  @override
  Future<FeedModel> getFeed() async {
    final json = await _api.getJson(ApiConstants.feed);
    return FeedModel.fromJson(json);
  }

  @override
  Future<CourseDetailsModel> getCourseDetails() async {
    final json = await _api.getJson(ApiConstants.feedDetails);
    return CourseDetailsModel.fromJson(json);
  }
}
