import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
            Stack(
              alignment: Alignment.topRight,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white60,
                    child: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
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
