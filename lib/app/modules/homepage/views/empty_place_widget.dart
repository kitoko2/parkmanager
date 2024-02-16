import 'package:flutter/material.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class EmptyPlaceWidget extends StatelessWidget {
  const EmptyPlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Aucune place trouvée",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: ConstantString.secondpoliceApp,
          ),
        ),
        const Text(
          'Appuyer sur "+" pour ajouter votre première place de parking',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
