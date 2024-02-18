import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkmanager/app/models/reservatiom_model.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class ReservationService {
  // Fonction pour envoyer une demande de réservation de place de parking
  static Future<ReservationResponse> requestParkingReservation(
      String placeId,
      String userId,
      String adminId,
      int numberOfHours,
      String? detailPlace) async {
    try {
      final reservationExist = await checkExistingReservation(userId, placeId);
      if (reservationExist) {
        return const ReservationResponse(
            message:
                "Vous avez déja réservé cette place, veuiller attendre le retour de l'admin",
            status: false);
      }
      await FirebaseFirestore.instance
          .collection(ConstantString.reservationCollectionName)
          .add({
        'placeId': placeId,
        'userId': userId,
        'adminId': adminId,
        'status': 'pending',
        'numberOfHours': numberOfHours,
        "detailPlace": detailPlace,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Demande de réservation envoyée avec succès !');
      return const ReservationResponse(
          status: true,
          message: "Demande de réservation envoyée avec succès !");
    } on FirebaseException catch (e) {
      print('Erreur lors de la création de la place de parking : $e');
      return ReservationResponse(message: e.message, status: false);
    } catch (e) {
      print("Erreur lors de l'envoi de la demande de réservation : $e");
      return ReservationResponse(message: e.toString(), status: false);
    }
  }

  // Fonction pour récupérer les réservations associées à un administrateur spécifique
  static Future<List<Reservation>> getAdminReservations(String adminId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(ConstantString.reservationCollectionName)
              .where('adminId', isEqualTo: adminId)
              .get();

      return listReservation(querySnapshot);
    } catch (e) {
      print('Erreur lors de la récupération des réservations : $e');
      return [];
    }
  }

  // Fonction pour récupérer les réservations associées à un public user spécifique
  static Future<List<Reservation>> getPublicUserReservations(
      String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(ConstantString.reservationCollectionName)
              .where('userId', isEqualTo: userId)
              .get();

      return listReservation(querySnapshot);
    } catch (e) {
      print('Erreur lors de la récupération des réservations : $e');
      return [];
    }
  }

  // Fonction pour vérifier si l'utilisateur a déjà une réservation active pour une place de parking
  static Future<bool> checkExistingReservation(
      String userId, String placeId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(ConstantString.reservationCollectionName)
              .where('userId', isEqualTo: userId)
              .where('placeId', isEqualTo: placeId)
              .where('status', isEqualTo: 'pending')
              .get();

      // Si une réservation existe déjà, retourner true ; sinon, retourner false
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Erreur lors de la vérification de la réservation existante : $e');
      return true;
    }
  }

  static List<Reservation> listReservation(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (DocumentSnapshot document) {
        return Reservation().getReservationFromSnapShot(document);
      },
    ).toList();
  }

  // Fonction pour accepter une réservation de place de parking
  static Future<ReservationResponse> acceptParkingReservation(
      String reservationId,
      String occupantId,
      String placeId,
      int busyDuring) async {
    try {
      final placeIsAvailable = await checkAvailabilityPlace(placeId);
      if (!placeIsAvailable) {
        return const ReservationResponse(
            message: "La place est déja occupé", status: false);
      }
      await FirebaseFirestore.instance
          .collection(ConstantString.reservationCollectionName)
          .doc(reservationId)
          .update({
        'status':
            'accepted', // Mettre à jour le statut de la réservation à "accepted"
      });

      await FirebaseFirestore.instance
          .collection(ConstantString.parkingPlaceCollectionName)
          .doc(placeId)
          .update({
        'isAvailable': false, // Marquer la place de parking comme occupée
        "busyDuring": busyDuring, // Modifier le temps d'occupation
        'occupantId':
            occupantId, // Ajouter l'ID de l'utilisateur qui occupe la place
      });

      print('Réservation acceptée avec succès !');
      return const ReservationResponse(
          message: "Vous avez assigné cette place avec succès", status: true);
    } on FirebaseException catch (e) {
      print('Erreur lors de la création de la place de parking : $e');
      return ReservationResponse(message: e.message, status: false);
    } catch (e) {
      print("Erreur lors de l'envoi de la demande de réservation : $e");
      return ReservationResponse(message: e.toString(), status: false);
    }
  }

// check si la place est deja occupé avant de l'assigner à un user
  static Future<bool> checkAvailabilityPlace(String placeId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> placeSnapshot =
          await FirebaseFirestore.instance
              .collection(ConstantString.parkingPlaceCollectionName)
              .doc(placeId)
              .get();
      bool isAvailable = (placeSnapshot.data() as dynamic)['isAvailable'];
      return isAvailable;
    } catch (e) {
      print(
          'Erreur lors de la vérification de la disponibilité de la place : $e');
      return false;
    }
  }
}

class ReservationResponse {
  final bool? status;
  final String? message;
  const ReservationResponse({this.message, this.status});
}
