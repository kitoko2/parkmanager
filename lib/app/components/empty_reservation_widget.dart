import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class EmptyReservationWidget extends StatelessWidget {
  final bool? isAdmin;
  const EmptyReservationWidget({super.key, this.isAdmin = true});

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
              "Aucune réservation trouvée",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: ConstantString.secondpoliceApp,
              ),
            ),
          ),
          Center(
            child: Text(
              isAdmin == true
                  ? 'Vous serez notifié si un utilisateur reserve dans votre parking'
                  : "Reservez dès maintenant une place pour vous garez",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
