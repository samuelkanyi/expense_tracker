import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(User user) = _Success;
  const factory LoginState.failed(String message) = _Failed;
}

// Extension methods for the generated classes
extension SuccessLoginStateExtension on _Success {
  _Success copyWithMessage(User newUser) {
    return _Success(newUser);
  }
}

extension FailedLoginStateExtension on _Failed {
  _Failed copyWithMessage(String newMessage) {
    return _Failed(newMessage);
  }
}
