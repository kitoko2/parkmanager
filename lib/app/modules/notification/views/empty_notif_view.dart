import 'package:flutter/material.dart';

class EmptyNotifView extends StatelessWidget {
  const EmptyNotifView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            'assets/notifs/bell.png',
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          "Aucune notification pour l'instant",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Vous n'avez pas encore reçu de notifications. Restez à l'écoute pour les mises à jour importantes et les nouvelles informations.",
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: kToolbarHeight,
        )
      ],
    );
  }
}
