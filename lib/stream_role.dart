import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkmanager/app/components/errorpage.dart';
import 'package:parkmanager/app/models/user_info.dart';
import 'package:parkmanager/app/modules/home_admin/views/home_admin_view.dart';
import 'package:parkmanager/app/modules/homepublic/views/homepublic_view.dart';
import 'package:parkmanager/app/services/authentification_service/firestore_db_auth.dart';

class StreamRoleView extends StatelessWidget {
  const StreamRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StreamRoleController());
    return StreamBuilder(
      stream: DatabaseFirestore(uid: controller.uid).userinfo,
      builder: (context, snap) {
        switch (snap.connectionState) {
          case ConnectionState.none:
            return const ErrorPage(
              description: 'Aucune connexion !',
              logoutBtn: false,
            );
          case ConnectionState.waiting:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snap.hasError) {
              return const ErrorPage(
                  description: 'Erreur de chargement des données !',
                  logoutBtn: true);
            }

            if (snap.hasData) {
              final data = snap.data;
              return data == null
                  ? const ErrorPage(
                      description: 'Erreur de chargement des données',
                      logoutBtn: true)
                  : data.role == UserRole.public
                      ? const HomepublicView()
                      : const HomeAdminView();
            } else {
              return const Scaffold(
                body: Center(child: Text('Aucune donnée disponible')),
              );
            }
          default:
            return const ErrorPage(
                description: 'Erreur inattendue', logoutBtn: true);
        }
      },
    );
  }
}

class StreamRoleController extends GetxController {
  late String uid;
  @override
  void onInit() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.onInit();
  }
}
