import 'package:bloc/bloc.dart';
import 'package:expense_tracker/app/models/signup/sign_up_model.dart';
import 'package:expense_tracker/app/repository/sign_up/sign_up_repository.dart';
import 'package:expense_tracker/injection/injection.dart';
import 'package:expense_tracker/sign_up/cubit/cubit/sign_up_state.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;
  SignUpCubit(this._signUpRepository) : super(const SignUpState.initial());

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    String? name,
    Map<String, dynamic>? additionalData,
  }) async {
    emit(const SignUpState.loading());

    try {
      // Prepare user data to store in profiles table
      final userData = <String, dynamic>{};
      if (name != null) userData['full_name'] = name;
      if (additionalData != null) userData.addAll(additionalData);

      final signUpModel = SignUpModel(
        email: email,
        password: password,
        name: name!,
      );

      final user = await _signUpRepository.signUp(
        signUpModel,
      );

      emit(SignUpState.success(user));
    } catch (e) {
      emit(SignUpState.failed(e.toString()));
    }
  }

  Future<void> verifyPhoneOTP({
    required String phone,
    required String token,
  }) async {
    emit(const SignUpState.loading());

    try {
      final success = await _signUpRepository.verifyPhoneOtp(
        phone,
        token,
      );

      if (success) {
        // Get the current user after verification
        final currentUser = getIt<SupabaseClient>().auth.currentUser;
        if (currentUser != null) {
          emit(SignUpState.success(currentUser));
        } else {
          emit(const SignUpState.failed('User verification failed'));
        }
      } else {
        emit(const SignUpState.failed('Failed to verify phone number'));
      }
    } catch (e) {
      emit(SignUpState.failed(e.toString()));
    }
  }

  void reset() {
    emit(const SignUpState.initial());
  }
}
