import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/models/reply_model.dart';
import 'package:threads_clone_app/widgets/circle_image.dart';
import 'package:threads_clone_app/widgets/reply_card_top_bar.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({
    super.key,
    required this.reply,
  });

  final ReplyModel reply;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: context.width * 0.12,
              child: CircleImage(
                url: reply.user?.metadata?.image,
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
                  ReplyCardTopBar(reply: reply),
                  Text(reply.reply!),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xff242424),
        )
      ],
    );
  }
}
