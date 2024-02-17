import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/models/parkingplace.dart';
import 'package:parkmanager/app/services/parking_service.dart/parking_management.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class HomepagepublicController extends GetxController {
  final styleSearch = TextStyle(
      fontFamily: ConstantString.policeApp,
      fontSize: 19,
      fontWeight: FontWeight.w300);

  TextEditingController searchEditController = TextEditingController();
  final searchEmpty = true.obs;

  int getSearch(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      return -99; // le champs entré n'est pas valide
    }
  }

  Stream<List<ParkingPlace>> searchParkingPlacesByEtage() {
    return ParkingManagementService.searchParkingPlacesByEtage(
      getSearch(searchEditController.text.trim()),
    );
  }

  @override
  void onInit() {
    searchEditController.addListener(() {
      searchEmpty.value = searchEditController.text.trim().isEmpty;
    });
    super.onInit();
  }
}
