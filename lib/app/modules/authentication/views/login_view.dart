import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/custom_text_form_field.dart';
import 'package:parkmanager/app/modules/authentication/controllers/login_controller.dart';
import 'package:parkmanager/app/modules/authentication/views/authentication_view.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Text(
              "Bon retours, connectez vous maintenant!",
              style: TextStyle(
                fontSize: 25,
                fontFamily: ConstantString.secondpoliceApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "C'est gratuit ! connectez vous et profitez de Park Manager",
              style: TextStyle(),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: "Mon email",
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: "Mon mot de passe",
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Vous êtes nouveau?"),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.off(const AuthenticationView());
                  },
                  child: const Text("S'inscrire"),
                )
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              title: "Continuer",
              onTap: () async {
                await controller.login();
              },
            )
          ],
        ),
      ),
    );
  }
}
