import 'package:flutter/material.dart';
import 'package:threads_clone_app/models/post_model.dart';

class PostTopBar extends StatelessWidget {
  const PostTopBar({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          post.user!.metadata!.name!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Row(
          children: [
            Text("9 hours ago"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.more_horiz),
          ],
        )
      ],
    );
  }
}
