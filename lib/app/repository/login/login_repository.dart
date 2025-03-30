import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  const LoginRepository();

  final User? currentUser = null;
  final bool isAuthenticated = false;
  final Stream<AuthState>? onAuthStateChange = null;
  Future<AuthResponse> signInEmail(String email, String password);
  Future<void> resetPassword({required String email});
  Future<void> updatePassword({required String newPassword});
  Future<void> signOut();
}
