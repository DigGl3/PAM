import 'package:get/get.dart';

import '../../domain/usecases/get_feed.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find<GetFeed>()));
  }
}
