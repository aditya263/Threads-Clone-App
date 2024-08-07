import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:threads_clone_app/utils/env.dart';
import 'package:threads_clone_app/widgets/confirm_box.dart';
import 'package:uuid/uuid.dart';

void showSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: const Color(0xff252526),
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 10,
    ),
    snackStyle: SnackStyle.GROUNDED,
    margin: const EdgeInsets.all(0),
  );
}

//* Pick image from gallery
Future<File?> pickImageFromGallery() async {
  const uuid = Uuid();
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if (file == null) return null;
  final dir = Directory.systemTemp;
  final targetPath = "${dir.absolute.path}/${uuid.v6()}.jpg";
  File image = await compressImage(File(file.path), targetPath);
  return image;
}

//Compress image file
Future<File> compressImage(File file, String targetPath) async {
  var result = await FlutterImageCompress.compressAndGetFile(
    file.path,
    targetPath,
    quality: 70,
  );
  return File(result!.path);
}

// To get s3 url
String getS3Url(String path) {
  return "${Env.supabaseUrl}/storage/v1/object/public/$path";
}

// * Confirm box
void confirmBox(
  String title,
  String text,
  VoidCallback callback,
  RxBool isLoading,
) {
  Get.dialog(
    ConfirmBox(
      title: title,
      text: text,
      callback: callback,
      isLoading: isLoading,
    ),
  );
}
