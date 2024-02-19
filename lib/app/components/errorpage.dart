import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/modules/authentication/views/authentication_view.dart';
import 'package:parkmanager/app/services/authentification_service/auth_service.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class ErrorPage extends StatelessWidget {
  final String description;
  final bool logoutBtn;

  const ErrorPage(
      {super.key, required this.description, required this.logoutBtn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  "Une erreur est survenue",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantString.secondpoliceApp,
                  ),
                ),
              ),
              Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              if (logoutBtn)
                CustomSecondaryButtom(
                  width: double.infinity,
                  onTap: () {
                    AuthentificationService.logout();
                    Get.offAll(const AuthenticationView());
                  },
                  title: 'Relancer',
                )
            ],
          ),
        ),
      ),
    );
  }
}
