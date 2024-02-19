import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkmanager/utils/utils_function.dart';

class Reservation {
  String? id;
  String? placeId;
  String? userId;
  String? status;
  int? numberOfHours;
  String? timestamp;
  String? detailPlace;

  Reservation(
      {this.id,
      this.placeId,
      this.userId,
      this.status,
      this.numberOfHours,
      this.detailPlace,
      this.timestamp});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    placeId = json['placeId'];
    userId = json['userId'];
    status = json['status'];
    numberOfHours = json['numberOfHours'];
    timestamp = UtilFunction.timestampToString(json["timestamp"]);
    detailPlace = json['detailPlace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data['placeId'] = placeId;
    data['userId'] = userId;
    data['status'] = status;
    data['numberOfHours'] = numberOfHours;
    data['timestamp'] = timestamp;
    data['detailPlace'] = detailPlace;
    return data;
  }

  Reservation getReservationFromSnapShot(DocumentSnapshot snapshot) {
    return Reservation(
      id: snapshot.id,
      placeId: (snapshot.data() as dynamic)["placeId"],
      userId: (snapshot.data() as dynamic)["userId"],
      status: (snapshot.data() as dynamic)["status"],
      numberOfHours: (snapshot.data() as dynamic)["numberOfHours"],
      timestamp: UtilFunction.timestampToString(
          (snapshot.data() as dynamic)["timestamp"]),
      detailPlace: (snapshot.data() as dynamic)["detailPlace"],
    );
  }
}
