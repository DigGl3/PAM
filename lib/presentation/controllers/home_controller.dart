import 'package:get/get.dart';

import '../../core/error/result.dart';
import '../../core/routes/app_routes.dart';
import '../../domain/entities/feed.dart';
import '../../domain/usecases/get_feed.dart';
import '../state/view_state.dart';

/// Controllerul ecranului Home: cere datele prin use case-ul [GetFeed]
/// și expune starea (loading / content / error) către UI.
class HomeController extends GetxController {
  HomeController(this._getFeed);

  final GetFeed _getFeed;

  final state = Rx<ViewState<Feed>>(const LoadingState<Feed>());

  @override
  void onInit() {
    super.onInit();
    loadFeed();
  }

  /// Încarcă datele. La pull-to-refresh ([showLoader] = false) păstrăm
  /// conținutul vechi pe ecran și, dacă apare o eroare, arătăm un snackbar.
  Future<void> loadFeed({bool showLoader = true}) async {
    if (showLoader) state.value = const LoadingState<Feed>();

    final result = await _getFeed();

    switch (result) {
      case Success(:final data):
        state.value = ContentState(data);
      case Failed(:final failure):
        if (!showLoader && state.value is ContentState<Feed>) {
          Get.snackbar('Eroare', failure.message,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          state.value = ErrorState(failure.message);
        }
    }
  }

  Future<void> refreshFeed() => loadFeed(showLoader: false);

  void openCourse() => Get.toNamed(AppRoutes.course);
}
