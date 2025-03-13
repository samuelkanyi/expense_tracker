import 'package:expense_tracker/app/models/signup/sign_up_model.dart';
import 'package:expense_tracker/app/repository/sign_up_repository.dart';
import 'package:expense_tracker/injection/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl extends SignUpRepository {
  SignUpRepositoryImpl() {
    client = getIt<SupabaseClient>();
  }
  late final SupabaseClient client;

  User? get currentUser => client.auth.currentUser;
  @override
  Future<User> signUp(SignUpModel signUpModel) async {
    try {
      final response = await client.auth.signUp(
        email: signUpModel.email,
        password: signUpModel.password,
      );

      if (response.user == null) {
        throw Exception('User registration failed');
      }

      await client.from('profiles').insert({
        'id': response.user!.id,
        'email': signUpModel.email,
        'created_at': DateTime.now().toIso8601String(),
      });

      return response.user!;
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  @override
  Future<bool> verifyPhoneOtp(String phone, String token) async {
    try {
      final response = await client.auth.verifyOTP(
        phone: phone,
        token: token,
        type: OtpType.sms,
      );

      return response.session != null;
    } catch (e) {
      throw Exception('Phone verification failed: ${e.toString()}');
    }
  }
}
