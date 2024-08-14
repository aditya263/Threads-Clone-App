import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/services/navigation_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/helper.dart';

class PostTopBar extends StatelessWidget {
  PostTopBar({
    super.key,
    required this.post,
  });

  final PostModel post;
  final SupabaseService supabaseService = Get.find<SupabaseService>();
  final NavigationService navigationService = Get.put(NavigationService());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => supabaseService.currentUser.value?.id == post.userId
              ? navigationService.updateIndex(4)
              : Get.toNamed(RouteNames.showUser, arguments: post.userId),
          child: Text(
            post.user!.metadata!.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
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
