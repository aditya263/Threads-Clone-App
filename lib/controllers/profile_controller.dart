import 'dart:io';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/models/reply_model.dart';
import 'package:threads_clone_app/models/user_model.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/env.dart';
import 'package:threads_clone_app/utils/helper.dart';

class ProfileController extends GetxController {
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);
  var postLoading = false.obs;
  RxList<PostModel> posts = RxList<PostModel>();
  var replyLoading = false.obs;
  RxList<ReplyModel> replies = RxList<ReplyModel>();

  var userLoading = false.obs;
  Rx<UserModel> user = Rx<UserModel>(UserModel());

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

  // * Fetch User
  void fetchUser(String userId) async {
    try {
      userLoading.value = true;
      final res = await SupabaseService.client
          .from("users")
          .select("*")
          .eq("id", userId)
          .single();
      userLoading.value = false;
      user.value = UserModel.fromJson(res);
      // * Fetch user threads and replies
      fetchUserThreads(userId);
      fetchReplies(userId);
    } catch (e) {
      userLoading.value = false;
      showSnackBar("Error", "Something went wrong!");
    }
  }

  // * Fetch Post
  void fetchUserThreads(String userId) async {
    try {
      postLoading.value = true;
      final List<dynamic> response =
          await SupabaseService.client.from("posts").select('''
    id,content,image,created_at,comment_count,like_count,user_id,
    user:user_id(email,metadata), likes:likes(user_id,post_id)
    ''').eq("user_id", userId).order("id", ascending: false);
      postLoading.value = false;
      if (response.isNotEmpty) {
        posts.value = [for (var item in response) PostModel.fromJson(item)];
      }
    } catch (e) {
      postLoading.value = false;
      showSnackBar("Error", "Something went wrong!");
    }
  }

  // * Fetch Replies
  void fetchReplies(String userId) async {
    try {
      replyLoading.value = true;
      final List<dynamic> response =
          await SupabaseService.client.from("comments").select('''
    id,user_id,post_id,reply,created_at,user:user_id(email,metadata)
    ''').eq("user_id", userId).order("id", ascending: false);
      replyLoading.value = false;
      if (response.isNotEmpty) {
        replies.value = [for (var item in response) ReplyModel.fromJson(item)];
      }
    } catch (e) {
      replyLoading.value = false;
      showSnackBar("Error", "Something went wrong!");
    }
  }
}
