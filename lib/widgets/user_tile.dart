import 'package:flutter/material.dart';
import 'package:threads_clone_app/models/user_model.dart';
import 'package:threads_clone_app/utils/helper.dart';
import 'package:threads_clone_app/utils/styles/button_styles.dart';
import 'package:threads_clone_app/widgets/circle_image.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CircleImage(
          url: user.metadata?.image,
        ),
      ),
      title: Text(user.metadata!.name!),
      titleAlignment: ListTileTitleAlignment.top,
      trailing: OutlinedButton(
        onPressed: () {},
        style: customOutlineStyle(),
        child: const Text("View Profile"),
      ),
      subtitle: Text(formateDateFromNow(user.createdAt!)),
    );
  }
}
