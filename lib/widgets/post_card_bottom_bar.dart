import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/controllers/thread_controller.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/services/supabase_service.dart';

class PostCardBottomBar extends StatefulWidget {
  const PostCardBottomBar({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  State<PostCardBottomBar> createState() => _PostCardBottomBarState();
}

class _PostCardBottomBarState extends State<PostCardBottomBar> {
  String likeStatus = "";
  final ThreadController controller = Get.find<ThreadController>();
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  void likeDislike(String status) async {
    setState(() {
      likeStatus = status;
    });
    await controller.likeDislike(
      status,
      widget.post.id!,
      widget.post.userId!,
      supabaseService.currentUser.value!.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            likeStatus == "1"
                ? IconButton(
                    onPressed: () {
                      likeDislike("0");
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red[700],
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      likeDislike("1");
                    },
                    icon: const Icon(Icons.favorite_outline),
                  ),
            IconButton(
              onPressed: () {
                Get.toNamed(RouteNames.addReply, arguments: widget.post);
              },
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_outlined),
            ),
          ],
        ),
        Row(
          children: [
            Text("${widget.post.commentCount} replies"),
            const SizedBox(
              width: 10,
            ),
            Text("${widget.post.likeCount} likes"),
          ],
        ),
      ],
    );
  }
}
