import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkmanager/app/models/user_info.dart';
import 'package:parkmanager/app/services/authentification_service/firestore_db_auth.dart';

class AuthentificationService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<ResultFirebaseAuth> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      return ResultFirebaseAuth(user: user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return ResultFirebaseAuth(message: e.message);
    } catch (e) {
      print(e.toString());
      return ResultFirebaseAuth(message: e.toString());
    }
  }

  static Future<ResultFirebaseAuth> registerWithEmailAndPassword(
      String email, String password, UserRole role) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      await DatabaseFirestore(uid: user!.uid)
          .saveUser(email: email, role: role);
      return ResultFirebaseAuth(user: user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return ResultFirebaseAuth(message: e.message);
    } catch (e) {
      print(e.toString());
      return ResultFirebaseAuth(message: e.toString());
    }
  }

  static Future logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class ResultFirebaseAuth {
  final User? user;
  final String? message;

  ResultFirebaseAuth({this.message, this.user});
}
