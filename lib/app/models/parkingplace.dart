import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingPlace {
  String? id;
  int? placeNumber;
  int? etage;
  String? adminId;
  bool? isAvailable;
  int? busyDuring;
  String? occupantId;
  String? reservationId;

  ParkingPlace(
      {this.id,
      this.placeNumber,
      this.etage,
      this.adminId,
      this.isAvailable,
      this.busyDuring,
      this.occupantId,
      this.reservationId});

  ParkingPlace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeNumber = json['placeNumber'];
    etage = json['etage'];
    adminId = json['adminId'];
    isAvailable = json['isAvailable'];
    busyDuring = json['busyDuring'];
    occupantId = json['occupantId'];
    reservationId = json["reservationId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['placeNumber'] = placeNumber;
    data['etage'] = etage;
    data['adminId'] = adminId;
    data['isAvailable'] = isAvailable;
    data['busyDuring'] = busyDuring;
    data['occupantId'] = occupantId;
    data["reservationId"] = reservationId;
    return data;
  }

  ParkingPlace getPlaceParkingForSnapshot(DocumentSnapshot snapshot) {
    return ParkingPlace(
      id: snapshot.id,
      placeNumber: (snapshot.data() as dynamic)["placeNumber"],
      etage: (snapshot.data() as dynamic)["etage"],
      adminId: (snapshot.data() as dynamic)["adminId"],
      isAvailable: (snapshot.data() as dynamic)["isAvailable"],
      busyDuring: (snapshot.data() as dynamic)["busyDuring"],
      occupantId: (snapshot.data() as dynamic)["occupantId"],
      reservationId: (snapshot.data() as dynamic)["reservationId"],
    );
  }
}
