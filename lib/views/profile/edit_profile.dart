import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/controllers/profile_controller.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/widgets/circle_image.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController textEditingController =
      TextEditingController(text: "");
  final ProfileController controller = Get.find<ProfileController>();
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  @override
  void initState() {
    textEditingController.text =
        supabaseService.currentUser.value?.userMetadata?["description"];
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Done"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(() {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleImage(
                    radius: 80,
                    file: controller.image.value,
                    url: supabaseService
                        .currentUser.value!.userMetadata?["image"],
                  ),
                  IconButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    icon: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white60,
                      child: Icon(Icons.edit),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Your description",
                label: Text("Description"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
