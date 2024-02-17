import "package:cloud_firestore/cloud_firestore.dart";
import "package:parkmanager/app/models/user_info.dart";

class DatabaseFirestore {
  final String? uid;
  DatabaseFirestore({this.uid});

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  saveUser({String? email, UserRole? role}) async {
    return userCollection.doc(uid).set({
      "email": email,
      "role": role?.converttoString(),
    });
  }

  UserInformation infoUser(DocumentSnapshot snapshot) {
    return UserInformation(
      uid: snapshot.id,
      email: (snapshot.data() as dynamic)["email"],
      role: convertStringToUserRole((snapshot.data() as dynamic)["role"]),
    );
  }

  Stream<UserInformation> get userinfo {
    return userCollection.doc(uid).snapshots().map(infoUser);
  }
}
