import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Threads',
      theme: theme,
      getPages: Routes.pages,
      initialRoute: RouteNames.login,
      defaultTransition: Transition.noTransition,
    );
  }
}
