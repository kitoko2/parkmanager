import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/custom_button.dart';
import 'package:parkmanager/app/components/custom_text_form_field.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

import '../controllers/addparkingplace_controller.dart';

class AddparkingplaceView extends GetView<AddparkingplaceController> {
  const AddparkingplaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddparkingplaceController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text(
              "Ajouter une place pour votre parking",
              style: TextStyle(
                fontSize: 25,
                fontFamily: ConstantString.secondpoliceApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "C'est simple ! remplissez ces champs puis valider",
              style: TextStyle(),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: "Numéro de la place",
              controller: controller.numberPlaceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: "Etage de la place",
              controller: controller.etagePlaceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            CustomButton(
              title: "Ajouter",
              onTap: () async {
                await controller.createParkingPlace();
              },
            )
          ],
        ),
      ),
    );
  }
}
