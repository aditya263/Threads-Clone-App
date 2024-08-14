import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/services/navigation_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/helper.dart';
import 'package:threads_clone_app/utils/type_def.dart';

class PostTopBar extends StatelessWidget {
  PostTopBar({
    super.key,
    required this.post,
    this.isAuthCard = false,
    this.callback,
  });

  final PostModel post;
  final bool isAuthCard;
  final DeleteCallback? callback;
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
            isAuthCard
                ? GestureDetector(
                    onTap: () {
                      confirmBox("Are you sure?",
                          "Once it's deleted then won't recover it.", () {
                        callback!(post.id!);
                      }, false.obs);
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                : const Icon(Icons.more_horiz),
          ],
        )
      ],
    );
  }
}
