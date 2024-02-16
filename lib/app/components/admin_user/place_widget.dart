import 'package:flutter/material.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';

class PlaceWidget extends StatelessWidget {
  final bool isbusy;
  const PlaceWidget({super.key, required this.isbusy});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ConstantColors.secondColor),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            width: 100,
            height: 40,
            child: isbusy
                ? Image.asset(
                    "assets/car.png",
                  )
                : const SizedBox(),
          ),
          const Text(
            "N°20 , Etage 2",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isbusy ? "Occupé pour 2h" : "Libre",
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isbusy ? Colors.red : Colors.green),
                width: 7,
                height: 7,
              )
            ],
          )
        ],
      ),
    );
  }
}
