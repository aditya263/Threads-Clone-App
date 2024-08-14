import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/models/user_model.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/services/navigation_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/helper.dart';
import 'package:threads_clone_app/utils/styles/button_styles.dart';
import 'package:threads_clone_app/widgets/circle_image.dart';

class UserTile extends StatelessWidget {
  UserTile({
    super.key,
    required this.user,
  });

  final UserModel user;
  final SupabaseService supabaseService = Get.find<SupabaseService>();
  final NavigationService navigationService = Get.put(NavigationService());

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
        onPressed: () => supabaseService.currentUser.value?.id == user.id
            ? navigationService.updateIndex(4)
            : Get.toNamed(RouteNames.showUser, arguments: user.id),
        style: customOutlineStyle(),
        child: const Text("View Profile"),
      ),
      subtitle: Text(formateDateFromNow(user.createdAt!)),
    );
  }
}
