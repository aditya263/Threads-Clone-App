import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/views/auth/login.dart';
import 'package:threads_clone_app/views/auth/register.dart';
import 'package:threads_clone_app/views/home.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteNames.home,
      page: () => const Home(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const Login(),
      transition: Transition.fade,
    ),
    GetPage(
      name: RouteNames.register,
      page: () => const Register(),
      transition: Transition.fadeIn,
    ),
  ];
}
