import 'package:get/get.dart';

import '../controllers/homepublic_controller.dart';

class HomepublicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepublicController>(
      () => HomepublicController(),
    );
  }
}
