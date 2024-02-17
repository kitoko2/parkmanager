import 'package:get/get.dart';

import '../controllers/homepagepublic_controller.dart';

class HomepagepublicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepagepublicController>(
      () => HomepagepublicController(),
    );
  }
}
