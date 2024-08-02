import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    super.key,
    required this.label,
    required this.hintText,
    this.isPasswordField = false,
    required this.controller,
  });

  final String label, hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        label: Text(label),
        hintText: hintText,
      ),
    );
  }
}
