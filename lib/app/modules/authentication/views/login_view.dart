import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/custom_text_form_field.dart';
import 'package:parkmanager/app/modules/home/views/home_view.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
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
            const CustomTextFormField(hintText: "Mon email"),
            const SizedBox(height: 10),
            const CustomTextFormField(
              hintText: "Mon mot de passe",
              obscureText: true,
            ),
            const SizedBox(height: 30),
            CustomButton(
              title: "Continuer",
              onTap: () {
                Get.off(const HomeView());
              },
            )
          ],
        ),
      ),
    );
  }
}
