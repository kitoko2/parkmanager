import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/custom_text_form_field.dart';
import 'package:parkmanager/app/models/user_info.dart';
import 'package:parkmanager/app/modules/authentication/views/login_view.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0.0;
    final controller = Get.put(AuthenticationController());
    return Scaffold(
      body: Container(
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
            CustomTextFormField(
              hintText: "Mon email",
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: "Mon mot de passe",
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 15),
            Obx(() {
              return CupertinoSlidingSegmentedControl(
                children: const {
                  UserRole.public: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Utilisateur public"),
                  ),
                  UserRole.admin: Text("Administarteur"),
                },
                onValueChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  controller.userRole.value = value;
                },
                groupValue: controller.userRole.value,
              );
            }),
            const SizedBox(height: 10),
            Obx(
              () => RoleHelpText(
                isPublic: controller.userRole.value == UserRole.public,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Vous avez déja un compte?"),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.off(const LoginView());
                  },
                  child: const Text("Vous connecter"),
                )
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              title: "Continuer",
              onTap: () async {
                await controller.register();
              },
            )
          ],
        ),
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

class RoleHelpText extends StatelessWidget {
  final bool isPublic;
  const RoleHelpText({super.key, required this.isPublic});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          const Icon(
            Icons.help,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              isPublic
                  ? "Vous pourrez rechercher une place libre dans un parking , faire une reservation puis attendre la reponse de l'admin du parking pour vous garrer"
                  : "Vous pourrez ajouter et gerer (assigner , désassigner) des places dans votre parking ",
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
