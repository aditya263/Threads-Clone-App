import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/utils/helper.dart';

class ThreadController extends GetxController {
  final TextEditingController textEditingController =
      TextEditingController(text: "");
  var content = "".obs;
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);

  void pickImage() async {
    File? file = await pickImageFromGallery();
    if (file != null) {
      image.value = file;
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
