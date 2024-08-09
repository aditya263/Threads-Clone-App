import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/routes/route_names.dart';

class PostCardBottomBar extends StatelessWidget {
  const PostCardBottomBar({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(RouteNames.addReply, arguments: post);
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
            Text("${post.commentCount} replies"),
            const SizedBox(
              width: 10,
            ),
            Text("${post.likeCount} likes"),
          ],
        ),
      ],
    );
  }
}
