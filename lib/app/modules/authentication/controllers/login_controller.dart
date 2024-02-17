import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/modules/home_admin/views/home_admin_view.dart';
import 'package:parkmanager/app/services/authentification_service/auth_service.dart';
import 'package:parkmanager/stream_role.dart';
import 'package:parkmanager/utils/dialog.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (!GetUtils.isEmail(email)) {
      Fluttertoast.showToast(msg: "Email invalide");
      return;
    }
    if (password.length < 6) {
      Fluttertoast.showToast(msg: "Mot de passe trop court");
      return;
    }
    CustomDialog.customLoad();
    final res = await AuthentificationService.signInWithEmailAndPassword(
        email, password);
    Get.back();
    if (res.user != null) {
      print(res);
      Get.offAll(const StreamRoleView());
    } else {
      CustomDialog.errorDialog(description: res.message ?? "");
    }
  }
}
