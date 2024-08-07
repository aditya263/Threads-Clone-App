import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/services/storage_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/storage_keys.dart';

class SettingController extends GetxController{
  void logout() async{
    // Remove user session from local storage
    StorageService.session.remove(StorageKeys.userSession);
    await SupabaseService.client.auth.signOut();
    Get.offAllNamed(RouteNames.login);
  }
}