import 'package:flutter/material.dart';
import 'package:threads_clone_app/widgets/auth_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
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
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Welcome Back'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const AuthInput(
                  label: 'Email',
                  hintText: 'Enter your email.',
                ),
                const SizedBox(
                  height: 20,
                ),
                const AuthInput(
                  label: 'Password',
                  hintText: 'Enter your password.',
                  isPasswordField: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
