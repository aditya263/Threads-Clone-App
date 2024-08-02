import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/widgets/auth_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 60,
                    height: 60,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Welcome to the threads world'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthInput(
                    controller: nameController,
                    label: 'Name',
                    hintText: 'Enter your name.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthInput(
                    controller: emailController,
                    label: 'Email',
                    hintText: 'Enter your email.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthInput(
                    controller: passwordController,
                    label: 'Password',
                    hintText: 'Enter your password.',
                    isPasswordField: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthInput(
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    hintText: 'Enter your confirm password.',
                    isPasswordField: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size.fromHeight(40),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Submit"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " Login",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pop(context),
                        ),
                      ],
                      text: "Already have an account?",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
