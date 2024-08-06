import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final String supabaseUrl = dotenv.env["SUPABASE_URL"]!;
  static final String supabasekey = dotenv.env["SUPABASE_KEY"]!;
  static final String s3Bucket = dotenv.env["S3_BUCKET"]!;
}
