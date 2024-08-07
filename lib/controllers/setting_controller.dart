import 'package:get/get.dart';
import 'package:threads_clone_app/routes/route_names.dart';
import 'package:threads_clone_app/services/storage_service.dart';
import 'package:threads_clone_app/services/supabase_service.dart';
import 'package:threads_clone_app/utils/helper.dart';
import 'package:threads_clone_app/utils/storage_keys.dart';

class SettingController extends GetxController{

  var logoutLoading = false.obs;


  void logout() async{
    logoutLoading.value=true;
    // Remove user session from local storage
    try {
      StorageService.session.remove(StorageKeys.userSession);
      await SupabaseService.client.auth.signOut();
      Get.offAllNamed(RouteNames.login);
      logoutLoading.value=false;
    }catch (e) {
      logoutLoading.value=false;
      showSnackBar('Error', 'Failed to log out. Please try again.');
    } finally {
      logoutLoading.value=false;
    }
  }
}