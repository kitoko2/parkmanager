import 'package:get/get.dart';
import 'package:parkmanager/utils/dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class UtilFunction {
  static Future<void> sendSuggestionMailTo(String email) async {
    final Uri url =
        Uri.parse("mailto:$email?subject=SUGGESTION POUR AMELIORATION");
    if (!await launchUrl(url)) {
      log('Could not launch $url');
    }
  }

  static Future<void> sendWhatsappMessage(String numberReceveur) async {
    final Uri url = Uri.parse("whatsapp://send?phone=$numberReceveur");
    if (!await launchUrl(url)) {
      log('Could not launch $url');
    }
  }

  static Future<void> shareApk() async {
    CustomDialog.customLoad();
    await Share.share(
      "https://www.linkedin.com/in/ezechiel-dogbo-668572230/ .\n L'application ultime pour la gestion des parkings pour entreprise . Plus besoin de perdre du temps coté utilisateur pour vous garer !",
      subject: "Park manager",
    );
    Get.back();
  }

  static Future<void> shareData(String data) async {
    CustomDialog.customLoad();
    await Share.share(
      data,
      subject: "Park manager",
    );
    Get.back();
  }
}
