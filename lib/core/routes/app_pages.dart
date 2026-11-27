import 'package:get/get.dart';

import '../../presentation/bindings/course_binding.dart';
import '../../presentation/bindings/home_binding.dart';
import '../../presentation/pages/course_page.dart';
import '../../presentation/pages/home_page.dart';
import 'app_routes.dart';

/// Legătura dintre rute, pagini și binding-urile lor (GetX).
abstract final class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.course,
      page: () => const CoursePage(),
      binding: CourseBinding(),
    ),
  ];
}
