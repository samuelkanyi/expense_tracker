import 'package:expense_tracker/app/repository/login/login_repository.dart';
import 'package:expense_tracker/injection/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  late final SupabaseClient _supabaseClient;
  late GoTrueClient _auth;
  LoginRepositoryImpl(this._supabaseClient) {
    _supabaseClient = getIt<SupabaseClient>();
    _auth = _supabaseClient.auth;
  }

  @override
  Future<AuthResponse> login(
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

  /// Sign in with phone number and OTP
  Future<void> signInWithPhone({
    required String phone,
    required String otp,
  }) async {
    try {
      await _auth.verifyOTP(
        phone: phone,
        token: otp,
        type: OtpType.sms,
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Send OTP to phone number
  Future<void> sendOtpToPhone({required String phone}) async {
    try {
      await _auth.signInWithOtp(
        phone: phone,
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Sign out the current user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      rethrow;
    }
  }

  /// Reset password
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.resetPasswordForEmail(email);
    } catch (error) {
      rethrow;
    }
  }

  /// Update password of authenticated user
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

  /// Get the current logged in user
  User? get currentUser => _auth.currentUser;

  /// Check if a user is logged in
  bool get isAuthenticated => _auth.currentUser != null;

  /// Stream of auth state changes
  Stream<AuthState> get onAuthStateChange => _auth.onAuthStateChange;
}
