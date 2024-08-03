import 'package:flutter/material.dart';

class AddThread extends StatelessWidget {
  const AddThread({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Thread"),
      ),
      body: const Center(
        child: Text("I am Add Thread"),
      ),
    );
  }
}
