import 'dart:io';

import 'package:flutter/material.dart';

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
        if (url != null)
          CircleAvatar(
            backgroundImage: NetworkImage(url!),
            radius: radius,
          )
        else if (file != null)
          CircleAvatar(
            backgroundImage: FileImage(file!),
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
