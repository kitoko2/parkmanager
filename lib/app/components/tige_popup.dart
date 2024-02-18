import 'package:flutter/material.dart';

class TigePopUp extends StatelessWidget {
  const TigePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
