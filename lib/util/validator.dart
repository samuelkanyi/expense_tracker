import 'package:email_validator/email_validator.dart' as email_validator;

abstract class Validator {
  const Validator();
  const factory Validator.required(
    String errorMessage,
  ) = RequiredFieldValidator;
  const factory Validator.email(
    String errorMessage,
  ) = EmailValidator;
  const factory Validator.passwordMatch(
    String Function() passwordToMatch,
    String errorMessage,
  ) = PasswordMatchValidator;
  const factory Validator.regex(
    RegExp pattern,
    String errorMessage,
  ) = RegexValidator;
  factory Validator.phone(String errorMessage) => Validator.regex(
        RegExp(r'^\+[1-9]\d{1,14}$'),
        errorMessage,
      );
  const factory Validator.external(
    String? Function() validate,
  ) = ExternalValidator;

  const factory Validator.and(
    List<Validator> validators,
  ) = IntersectionValidator;
  const factory Validator.or(
    List<Validator> validators,
  ) = SumValidator;

  //write a validator where password should not be the same
  const factory Validator.passwordNotSame(
    String Function() passwordToMatch,
    String errorMessage,
  ) = PasswordNotSameValidator;

  String? call(String? value);
}

class IntersectionValidator extends Validator {
  const IntersectionValidator(this.validators);
  final List<Validator> validators;

  @override
  String? call(String? value) {
    final errors = validators.map((v) => v.call(value)).where((e) => e != null);
    return errors.isEmpty ? null : errors.join('\n');
  }
}

class SumValidator extends Validator {
  const SumValidator(this.validators);
  final List<Validator> validators;

  @override
  String? call(String? value) {
    final errors = validators.map((v) => v.call(value));
    return errors.any((element) => element == null)
        ? null
        : errors.join(' or ');
  }
}

class RequiredFieldValidator extends Validator {
  const RequiredFieldValidator(this.errorMessage);
  final String errorMessage;

  @override
  String? call(String? value) => value?.isEmpty ?? true ? errorMessage : null;
}

class PasswordMatchValidator extends Validator {
  const PasswordMatchValidator(this.passwordToMatch, this.errorMessage);
  final String Function() passwordToMatch;
  final String errorMessage;

  @override
  String? call(String? value) =>
      value == passwordToMatch() ? null : errorMessage;
}

class RegexValidator extends Validator {
  const RegexValidator(this.pattern, this.errorMessage);
  final RegExp pattern;
  final String errorMessage;

  @override
  String? call(String? value) => value == null
      ? null
      : pattern.hasMatch(value)
          ? null
          : errorMessage;
}

class ExternalValidator extends Validator {
  const ExternalValidator(this.validate);
  final String? Function() validate;

  @override
  String? call(String? value) => validate();
}

class PasswordNotSameValidator extends Validator {
  const PasswordNotSameValidator(this.passwordToMatch, this.errorMessage);
  final String Function() passwordToMatch;
  final String errorMessage;

  @override
  String? call(String? value) =>
      value != passwordToMatch() ? null : errorMessage;
}

class EmailValidator extends Validator {
  const EmailValidator(this.errorMessage);
  final String errorMessage;

  @override
  String? call(String? value) => value?.isEmpty ?? true
      ? null
      : email_validator.EmailValidator.validate(value!)
          ? null
          : errorMessage;
}
