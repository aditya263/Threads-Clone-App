import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/controllers/thread_controller.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/widgets/add_thread_appbar.dart';
import 'package:threads_clone_app/widgets/circle_image.dart';
import 'package:threads_clone_app/widgets/thread_image_preview.dart';

class AddThread extends StatelessWidget {
  AddThread({super.key});

  final SupabaseService supabaseService = Get.find<SupabaseService>();
  final ThreadController controller = Get.put(ThreadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AddThreadAppBar(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return CircleImage(
                        url: supabaseService
                            .currentUser.value?.userMetadata?["image"],
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: context.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Text(
                              supabaseService
                                  .currentUser.value!.userMetadata?["name"],
                            );
                          }),
                          TextField(
                            autofocus: true,
                            controller: controller.textEditingController,
                            onChanged: (value) =>
                                controller.content.value = value,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            maxLines: 10,
                            minLines: 1,
                            maxLength: 1000,
                            decoration: const InputDecoration(
                              hintText: "Type a Thread",
                              border: InputBorder.none,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.pickImage(),
                            child: const Icon(Icons.attach_file),
                          ),

                          //To preview user image
                          Obx(() {
                            return Column(
                              children: [
                                if (controller.image.value != null)
                                  ThreadImagePreview(),
                              ],
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
