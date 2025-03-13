import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.freezed.dart';

@freezed
sealed class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState.initial() = SignUpInitial;
  const factory SignUpState.loading() = SignUpLoading;
  const factory SignUpState.success(User user) = SignUpSuccess;
  const factory SignUpState.failed(String message) = SignUpFailed;

  bool needsVerification() {
    return switch (this) {
      SignUpInitial() => true,
      SignUpLoading() => true,
      SignUpSuccess() => false,
      SignUpFailed() => false,
    };
  }
}
