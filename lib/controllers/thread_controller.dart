import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/models/reply_model.dart';
import 'package:threads_clone_app/services/navigation_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/env.dart';
import 'package:threads_clone_app/utils/helper.dart';
import 'package:uuid/uuid.dart';

class ThreadController extends GetxController {
  final TextEditingController textEditingController =
      TextEditingController(text: "");
  var content = "".obs;
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);
  var showThreadLoading = false.obs;
  Rx<PostModel> post = Rx<PostModel>(PostModel());
  var showReplyLoading = false.obs;
  RxList<ReplyModel> replies = RxList<ReplyModel>();

  void pickImage() async {
    File? file = await pickImageFromGallery();
    if (file != null) {
      image.value = file;
    }
  }

  void store(String userId) async {
    try {
      loading.value = true;
      const uuid = Uuid();
      final dir = "$userId/${uuid.v6()}";
      var imgPath = "";

      if (image.value != null && image.value!.existsSync()) {
        imgPath = await SupabaseService.client.storage
            .from(Env.s3Bucket)
            .upload(dir, image.value!);
      }

      //Add post in DB
      await SupabaseService.client.from('posts').insert({
        "user_id": userId,
        "content": content.value,
        "image": imgPath.isNotEmpty ? imgPath : null,
      });
      loading.value = false;
      resetState();
      Get.find<NavigationService>().currentIndex.value = 0;
      showSnackBar("Success", "Thread added successfully!");
    } on StorageException catch (e) {
      loading.value = false;
      showSnackBar("Error", e.message);
    } catch (e) {
      loading.value = false;
      showSnackBar("Error", 'Something went wrong!');
    }
  }

  //To show post/thread
  void show(int postId) async {
    try {
      post.value = PostModel();
      replies.value = [];
      showThreadLoading.value = true;
      final response = await SupabaseService.client.from("posts").select('''
      id,content,image,created_at,comment_count,like_count,user_id,
    user:user_id(email,metadata)
      ''').eq("id", postId).single();
      showThreadLoading.value = false;
      post.value = PostModel.fromJson(response);

      //* Fetch Replies
      fetchPostReplies(postId);
    } catch (e) {
      showThreadLoading.value = false;
      showSnackBar("Error", 'Something went wrong!');
    }
  }

  //Fetch post replies
  void fetchPostReplies(int postId) async {
    try {
      showReplyLoading.value = true;
      final List<dynamic> response =
          await SupabaseService.client.from("comments").select('''
    id,user_id,post_id,reply,created_at,user:user_id(email,metadata)
    ''').eq("post_id", postId).order("id", ascending: true);
      showReplyLoading.value = false;
      if (response.isNotEmpty) {
        replies.value = [for (var item in response) ReplyModel.fromJson(item)];
      }
    } catch (e) {
      showReplyLoading.value = false;
      showSnackBar("Error", 'Something went wrong!');
    }
  }

  //To reset thread state
  void resetState() {
    content.value = "";
    textEditingController.text = "";
    image.value = null;
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
