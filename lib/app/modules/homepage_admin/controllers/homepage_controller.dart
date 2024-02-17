import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomepageAdminController extends GetxController {
  late String uid;
  @override
  void onInit() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.onInit();
  }
}
