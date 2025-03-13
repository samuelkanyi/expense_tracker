import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
abstract class SignUpModel with _$SignUpModel {
  factory SignUpModel({
    required String name,
    required String email,
    required String password,
  }) = _SignUpModel;

  const SignUpModel._();
  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
