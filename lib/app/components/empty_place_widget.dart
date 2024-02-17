import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class EmptyPlaceWidget extends StatelessWidget {
  final bool? isAdmin;
  const EmptyPlaceWidget({super.key, this.isAdmin = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: LottieBuilder.asset(
              "assets/lotties/empty.json",
              repeat: false,
              width: 200,
            ),
          ),
          Center(
            child: Text(
              "Aucune place trouvée",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: ConstantString.secondpoliceApp,
              ),
            ),
          ),
          Center(
            child: Text(
              isAdmin!
                  ? 'Appuyer sur "+" pour ajouter votre première place de parking'
                  : "Nous avons pas trouvé de place disponible",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
