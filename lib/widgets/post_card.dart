import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/models/post_model.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/utils/type_def.dart';
import 'package:threads_clone_app/widgets/circle_image.dart';
import 'package:threads_clone_app/widgets/post_card_bottom_bar.dart';
import 'package:threads_clone_app/widgets/post_card_image.dart';
import 'package:threads_clone_app/widgets/post_top_bar.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final bool isAuthCard;
  final DeleteCallback? callback;

  const PostCard({
    super.key,
    required this.post,
    this.isAuthCard = false,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.12,
                child: CircleImage(
                  url: post.user?.metadata?.image,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: context.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostTopBar(
                      post: post,
                      isAuthCard: isAuthCard,
                      callback: callback,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Get.toNamed(
                          RouteNames.showThread,
                          arguments: post.id,
                        ),
                      },
                      child: Text(post.content!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (post.image != null)
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteNames.showImage,
                              arguments: post.image!);
                        },
                        child: PostCardImage(url: post.image!),
                      ),
                    PostCardBottomBar(post: post),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Color(0xff242424),
          ),
        ],
      ),
    );
  }
}
