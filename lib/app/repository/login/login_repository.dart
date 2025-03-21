import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  const LoginRepository();

  Future<AuthResponse> login(String email, String password);
}
