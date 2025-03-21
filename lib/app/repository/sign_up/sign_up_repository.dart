import 'package:expense_tracker/app/models/signup/sign_up_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpRepository {
  // add constructor that accepts a supabase client
  const SignUpRepository();
  Future<User> signUp(SignUpModel signUpModel);
  Future<bool> verifyPhoneOtp(String phone, String token);
}
