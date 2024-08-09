import 'package:get/get.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/services/supabase_service.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  RxList<PostModel> posts = RxList<PostModel>();

  @override
  void onInit() async {
    await fetchThreads();
    super.onInit();
  }

  Future<void> fetchThreads() async {
    loading.value = true;
    final List<dynamic> response =
        await SupabaseService.client.from("posts").select('''
    id,content,image,created_at,comment_count,like_count,user_id,
    user:user_id(email,metadata)
    ''').order("id", ascending: false);
    loading.value = false;
    if (response.isNotEmpty) {
      posts.value = [for (var item in response) PostModel.fromJson(item)];
    }
  }
}
