import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/controllers/setting_controller.dart';
import 'package:threads_clone_app/utils/helper.dart';

class Setting extends StatelessWidget {
  Setting({super.key});

  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                confirmBox(
                  "Are you sure?",
                  "Do you want to logout?",
                  () async {
                    controller.logout();
                  },
                  controller.logoutLoading,
                );
              },
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
