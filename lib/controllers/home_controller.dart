import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/models/user_model.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/helper.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  RxList<PostModel> posts = RxList<PostModel>();

  @override
  void onInit() async {
    await fetchThreads();
    listenChanges();
    super.onInit();
  }

  Future<void> fetchThreads() async {
    try {
      loading.value = true;
      final List<dynamic> response =
          await SupabaseService.client.from("posts").select('''
    id,content,image,created_at,comment_count,like_count,user_id,
    user:user_id(email,metadata), likes:likes(user_id,post_id)
    ''').order("id", ascending: false);
      loading.value = false;
      if (response.isNotEmpty) {
        posts.value = [for (var item in response) PostModel.fromJson(item)];
      }
    } catch (e) {
      loading.value = false;
      showSnackBar("Error", "Something went wrong!");
    }
  }

  // * Listen realtime threads changes

  void listenChanges() async {
    SupabaseService.client
        .channel('public:posts')
        .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            table: 'posts',
            callback: (payload) {
              final PostModel post = PostModel.fromJson(payload.newRecord);
              updateFeed(post);
            })
        .onPostgresChanges(
            event: PostgresChangeEvent.delete,
            schema: 'public',
            table: 'posts',
            callback: (payload) {
              posts.removeWhere(
                  (element) => element.id == payload.oldRecord["id"]);
            })
        .subscribe();
  }

  // * To update the feed
  void updateFeed(PostModel post) async {
    var user = await SupabaseService.client
        .from("users")
        .select("*")
        .eq("id", post.userId!)
        .single();

    post.likes = [];
    post.user = UserModel.fromJson(user);
    posts.insert(0, post);
  }
}
