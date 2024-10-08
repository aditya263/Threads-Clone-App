import 'dart:io';

import 'package:flutter/material.dart';
import 'package:threads_clone_app/utils/helper.dart';

class CircleImage extends StatelessWidget {
  final double radius;
  final String? url;
  final File? file;

  const CircleImage({
    super.key,
    this.radius = 20,
    this.url,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (file != null)
          CircleAvatar(
            backgroundImage: FileImage(file!),
            radius: radius,
          )
        else if (url != null)
          CircleAvatar(
            backgroundImage: NetworkImage(
              "${getS3Url(url!)}?t=${DateTime.now().millisecondsSinceEpoch}",
            ),
            radius: radius,
          )
        else
          CircleAvatar(
            radius: radius,
            backgroundImage: const AssetImage("assets/images/avatar.png"),
          ),
      ],
    );
  }
}
