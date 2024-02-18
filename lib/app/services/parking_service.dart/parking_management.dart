import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkmanager/app/models/parkingplace.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class ParkingManagementService {
  static Future<ResultCreateParking> createParkingPlace(
      int placeNumber, int etage, String adminId) async {
    try {
      bool placeExists = await parkingPlaceExists(placeNumber, etage, adminId);
      if (placeExists) {
        return ResultCreateParking(
            status: false, message: "Vous avez déja ajouté cette place!");
      }

      final parkingPlace = ParkingPlace(
        placeNumber: placeNumber,
        etage: etage,
        adminId: adminId,
        isAvailable: true,
        busyDuring: 0,
      );

      await FirebaseFirestore.instance
          .collection(ConstantString.parkingPlaceCollectionName)
          .add(parkingPlace.toJson());
      return ResultCreateParking(status: true);
    } on FirebaseException catch (e) {
      print('Erreur lors de la création de la place de parking : $e');
      return ResultCreateParking(message: e.message, status: false);
    } catch (e) {
      print('Erreur lors de la création de la place de parking : $e');
      return ResultCreateParking(message: e.toString(), status: false);
    }
  }

  // Fonction pour vérifier si une place de parking existe déjà
  static Future<bool> parkingPlaceExists(
      int placeNumber, int etage, String adminId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(ConstantString.parkingPlaceCollectionName)
          .where('placeNumber', isEqualTo: placeNumber)
          .where('etage', isEqualTo: etage)
          .where('adminId', isEqualTo: adminId)
          .limit(1)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print(
          'Erreur lors de la vérification de l\'existence de la place de parking : $e');
      return false;
    }
  }

  static Stream<List<ParkingPlace>> getParkingPlacesByAdminId(String adminId) {
    // Créer une requête pour récupérer les places de parking avec l'ID de l'administrateur spécifié
    Query query = FirebaseFirestore.instance
        .collection(ConstantString.parkingPlaceCollectionName)
        .where('adminId', isEqualTo: adminId);

    return query.snapshots().map(listPlacesParking);
  }

  static List<ParkingPlace> listPlacesParking(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (DocumentSnapshot document) {
        return ParkingPlace().getPlaceParkingForSnapshot(document);
      },
    ).toList();
  }

  //for public user
  static Stream<List<ParkingPlace>> searchParkingPlacesByEtage(int etage) {
    Query query = FirebaseFirestore.instance
        .collection(ConstantString.parkingPlaceCollectionName)
        .where('etage', isEqualTo: etage)
        .where('isAvailable', isEqualTo: true);

    return query.snapshots().map(listPlacesParking);
  }
}

class ResultCreateParking {
  final bool status;
  final String? message;

  ResultCreateParking({required this.status, this.message});
}
