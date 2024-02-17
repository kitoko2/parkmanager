import 'package:flutter/material.dart';
import 'package:parkmanager/app/models/parkingplace.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';

class PlaceWidget extends StatelessWidget {
  final ParkingPlace parkingPlace;
  const PlaceWidget({super.key, required this.parkingPlace});

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
            child: parkingPlace.isAvailable == false
                ? Image.asset(
                    "assets/car.png",
                  )
                : const SizedBox(),
          ),
          Text(
            "N°${parkingPlace.placeNumber} , Etage ${parkingPlace.etage}",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                parkingPlace.isAvailable == false
                    ? "Occupé pour ${parkingPlace.busyDuring}h"
                    : "Libre",
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: parkingPlace.isAvailable == false
                        ? Colors.red
                        : Colors.green),
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
