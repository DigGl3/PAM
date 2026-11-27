import 'package:get/get.dart';

import '../../data/datasources/learning_remote_data_source.dart';
import '../../data/repositories/learning_repository_impl.dart';
import '../../domain/repositories/learning_repository.dart';
import '../../domain/usecases/get_course_details.dart';
import '../../domain/usecases/get_feed.dart';
import '../network/api_client.dart';

/// Dependency Injection: aici se leagă straturile între ele.
/// Presentation cere doar use case-uri; nu știe ce implementare e în spate.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Data
    Get.lazyPut<ApiClient>(() => ApiClient(), fenix: true);
    Get.lazyPut<LearningRemoteDataSource>(
      () => LearningRemoteDataSourceImpl(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<LearningRepository>(
      () => LearningRepositoryImpl(Get.find<LearningRemoteDataSource>()),
      fenix: true,
    );

    // Domain
    Get.lazyPut(() => GetFeed(Get.find<LearningRepository>()), fenix: true);
    Get.lazyPut(
      () => GetCourseDetails(Get.find<LearningRepository>()),
      fenix: true,
    );
  }
}
