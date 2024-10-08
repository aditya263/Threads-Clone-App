import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/views/auth/login.dart';
import 'package:threads_clone_app/views/auth/register.dart';
import 'package:threads_clone_app/views/home.dart';
import 'package:threads_clone_app/views/profile/edit_profile.dart';
import 'package:threads_clone_app/views/profile/show_user.dart';
import 'package:threads_clone_app/views/replies/add_reply.dart';
import 'package:threads_clone_app/views/settings/setting.dart';
import 'package:threads_clone_app/views/thread/show_image.dart';
import 'package:threads_clone_app/views/thread/show_thread.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteNames.home,
      page: () => Home(),
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
    GetPage(
      name: RouteNames.editProfile,
      page: () => const EditProfile(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteNames.settings,
      page: () => Setting(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteNames.addReply,
      page: () => AddReply(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteNames.showThread,
      page: () => const ShowThread(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteNames.showImage,
      page: () => ShowImage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteNames.showUser,
      page: () => const ShowUser(),
      transition: Transition.leftToRight,
    ),
  ];
}
