import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/utils/helper.dart';

class ShowImage extends StatelessWidget {
  ShowImage({super.key});

  final String image = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: InteractiveViewer(
          child: Image.network(
            getS3Url(image),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
