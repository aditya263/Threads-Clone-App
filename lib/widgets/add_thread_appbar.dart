import 'package:flutter/material.dart';

class AddThreadAppBar extends StatelessWidget {
  const AddThreadAppBar({super.key});

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
                onPressed: () {},
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
          TextButton(
            onPressed: () {},
            child: const Text(
              "Post",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
