import 'package:get/get.dart';

import '../../domain/usecases/get_course_details.dart';
import '../controllers/course_controller.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseController(Get.find<GetCourseDetails>()));
  }
}
