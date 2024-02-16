import 'package:get/get.dart';
import 'package:parkmanager/app/modules/authentication/views/authentication_view.dart';

class SettingController extends GetxController {
  logout() {
    Get.offAll(const AuthenticationView());
  }
}
