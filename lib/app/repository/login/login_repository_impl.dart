import 'package:expense_tracker/app/repository/login/login_repository.dart';
import 'package:expense_tracker/injection/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._supabaseClient) {
    _supabaseClient = getIt<SupabaseClient>();
    _auth = _supabaseClient.auth;
  }
  late final SupabaseClient _supabaseClient;
  late GoTrueClient _auth;

  @override
  Future<AuthResponse> signInEmail(
    String email,
    String password,
  ) async {
    try {
      final response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.resetPasswordForEmail(email);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UserResponse> updatePassword({required String newPassword}) async {
    try {
      final response = await _auth.updateUser(
        UserAttributes(password: newPassword),
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  Stream<AuthState> get onAuthStateChange => _auth.onAuthStateChange;
}
