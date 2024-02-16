// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ChooseImage {
  static Future<File?> getImage(ImageSource imageSource) async {
    XFile? xfile =
        await ImagePicker.platform.getImageFromSource(source: imageSource);
    if (xfile != null) {
      var file = File(xfile.path);

      return file;
    } else {
      return null;
    }
  }
}
