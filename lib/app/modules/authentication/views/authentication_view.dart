import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/custom_text_form_field.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0.0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.bottomLeft,
                //   end: Alignment.topRight,
                //   colors: [
                //     ConstantColors.primaryColor,
                //     Color.fromARGB(255, 94, 52, 102),
                //   ],
                // ),
                ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Text(
                  "Bienvenue, inscrivez vous maintenant!",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: ConstantString.secondpoliceApp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "C'est gratuit ! inscrivez vous et profitez de Park Manager",
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
                CustomButton(title: "Continuer", onTap: () {})
              ],
            ),
          )
        ],
      ),
      bottomSheet: keyboardIsOpen
          ? null
          : Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10 + MediaQuery.of(context).padding.bottom),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "En continuant, j'accepte les termes des ",
                      children: [
                        customTextCGU(
                            text: "Contrat utilisateur ", isUnderline: true),
                        customTextCGU(text: "et ", isUnderline: false),
                        customTextCGU(
                            text: "Contrat de licence Parkmanager Corp ",
                            isUnderline: true),
                        customTextCGU(
                            text:
                                "consens au traitement de mes informations personnelles conformément aux ",
                            isUnderline: false),
                        customTextCGU(
                            text: "Politique de confidentialité ",
                            isUnderline: true),
                        customTextCGU(text: ".", isUnderline: false),
                      ],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: ConstantString.policeApp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  TextSpan customTextCGU({bool isUnderline = true, required String text}) {
    return TextSpan(
      text: text,
      style: isUnderline
          ? const TextStyle(
              decoration: TextDecoration.underline,
            )
          : null,
    );
  }
}
