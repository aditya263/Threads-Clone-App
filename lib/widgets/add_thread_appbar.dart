import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/controllers/thread_controller.dart';
import 'package:threads_clone_app/services/navigation_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';

class AddThreadAppBar extends StatelessWidget {
  AddThreadAppBar({super.key});

  final ThreadController controller = Get.find<ThreadController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff242424),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.find<NavigationService>().backToPrevPage();
                },
                icon: const Icon(Icons.close),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "New Thread",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Obx(() {
            return TextButton(
              onPressed: () {
                if (controller.content.value.isNotEmpty) {
                  controller
                      .store(Get.find<SupabaseService>().currentUser.value!.id);
                }
              },
              child: controller.loading.value
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: controller.content.value.isNotEmpty
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
            );
          })
        ],
      ),
    );
  }
}
