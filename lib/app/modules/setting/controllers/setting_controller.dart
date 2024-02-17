import 'package:get/get.dart';
import 'package:parkmanager/app/modules/authentication/views/authentication_view.dart';
import 'package:parkmanager/app/services/authentification_service/auth_service.dart';

class SettingController extends GetxController {
  logout() {
    AuthentificationService.logout();
    Get.offAll(const AuthenticationView());
  }
}
