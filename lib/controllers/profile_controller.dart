import 'dart:io';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/env.dart';
import 'package:threads_clone_app/utils/helper.dart';

class ProfileController extends GetxController {
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);

  //*Update Profile method
  Future<void> updateProfile(String userId, String description) async {
    try {
      loading.value = true;
      var uploadedPath = "";
      if (image.value != null && image.value!.existsSync()) {
        final String dir = "$userId/profile.jpg";
        var path =
            await SupabaseService.client.storage.from(Env.s3Bucket).upload(
                  dir,
                  image.value!,
                  fileOptions: const FileOptions(
                    upsert: true,
                  ),
                );
        uploadedPath = path;
      }

      //*updtade profile

      await SupabaseService.client.auth.updateUser(
        UserAttributes(
          data: {
            "description": description,
            "image": uploadedPath.isNotEmpty ? uploadedPath : null,
          },
        ),
      );
      loading.value = false;
      Get.back();
      showSnackBar("Success", "Profile updated successfully!");
    } on StorageException catch (error) {
      loading.value = false;
      showSnackBar("Error", error.message);
    } on AuthException catch (error) {
      loading.value = false;
      showSnackBar("Error", error.message);
    } catch (error) {
      loading.value = false;
      showSnackBar("Error", "Something went Wrong!!");
    }
  }

  //* Pick the image
  void pickImage() async {
    File? file = await pickImageFromGallery();
    if (file != null) image.value = file;
  }
}
