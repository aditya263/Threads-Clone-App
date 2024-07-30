import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/views/home.dart';

class Routes {
  static final pages = [
    GetPage(name: RouteNames.home, page: () => const Home())
  ];
}
