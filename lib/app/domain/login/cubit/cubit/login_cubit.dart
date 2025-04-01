import 'package:bloc/bloc.dart';
import 'package:expense_tracker/app/repository/login/login_repository.dart';
import 'package:expense_tracker/app/domain/login/cubit/cubit/login_state.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepository) : super(const LoginState.initial());
  final LoginRepository _loginRepository;

  Future<void> login(String email, String password) async {
    try {
      emit(const LoginState.loading());
      final response = await _loginRepository.signInEmail(email, password);

      if (response.user != null) {
        emit(LoginState.success(response.user!));
      } else {
        emit(const LoginState.failed('Login failed'));
      }
    } catch (e) {
      emit(LoginState.failed(_handleAuthError(e)));
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      emit(const LoginState.loading());
      await _loginRepository.resetPassword(email: email);
      //emit password reset state sent
    } catch (e) {
      emit(LoginState.failed(_handleAuthError(e)));
    }
  }

  Future<void> updatePassword({required String newPassword}) async {
    try {
      emit(const LoginState.loading());
      await _loginRepository.updatePassword(newPassword: newPassword);
    } catch (e) {
      emit(LoginState.failed(_handleAuthError(e)));
    }
  }

  Future<void> signOut() async {
    try {
      emit(const LoginState.loading());
      await _loginRepository.signOut();
      emit(const LoginState.initial());
    } catch (e) {
      emit(LoginState.failed(_handleAuthError(e)));
    }
  }

  void checkAuthState() {
    final user = _loginRepository.currentUser;
    if (user != null) {
      emit(LoginState.success(user));
    } else {
      emit(const LoginState.initial());
    }
  }

  String _handleAuthError(dynamic error) {
    if (error is AuthException) {
      return error.message;
    } else if (error is String) {
      return error;
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }
}
