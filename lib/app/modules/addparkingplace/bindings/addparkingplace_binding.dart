import 'package:get/get.dart';

import '../controllers/addparkingplace_controller.dart';

class AddparkingplaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddparkingplaceController>(
      () => AddparkingplaceController(),
    );
  }
}
