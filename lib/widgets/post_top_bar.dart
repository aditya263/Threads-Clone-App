import 'package:flutter/material.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/utils/helper.dart';

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
        Row(
          children: [
            Text(formateDateFromNow(post.createdAt!)),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.more_horiz),
          ],
        )
      ],
    );
  }
}
