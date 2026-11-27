import 'package:get/get.dart';

import '../../core/error/result.dart';
import '../../domain/entities/course_details.dart';
import '../../domain/usecases/get_course_details.dart';
import '../state/view_state.dart';

/// Controllerul ecranului Course Overview.
class CourseController extends GetxController {
  CourseController(this._getCourseDetails);

  final GetCourseDetails _getCourseDetails;

  final state = Rx<ViewState<CourseDetails>>(
    const LoadingState<CourseDetails>(),
  );

  /// Tab-ul selectat ('lessons' / 'description').
  final selectedTab = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadDetails();
  }

  Future<void> loadDetails() async {
    state.value = const LoadingState<CourseDetails>();

    final result = await _getCourseDetails();

    switch (result) {
      case Success(:final data):
        // tab-ul selectat inițial vine din API
        if (selectedTab.value.isEmpty) {
          selectedTab.value = data.course.tabs.selected;
        }
        state.value = ContentState(data);
      case Failed(:final failure):
        state.value = ErrorState(failure.message);
    }
  }

  void selectTab(String id) => selectedTab.value = id;

  void goBack() => Get.back<void>();
}
