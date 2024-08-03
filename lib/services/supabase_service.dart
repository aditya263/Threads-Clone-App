import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone_app/utils/env.dart';

class SupabaseService extends GetxService {
  @override
  void onInit() async {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabasekey,
    );
    super.onInit();
  }

  static final SupabaseClient client = Supabase.instance.client;
}
