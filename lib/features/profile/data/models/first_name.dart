import 'package:formz/formz.dart';

enum FirstNameValidationError { invalid }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([super.value = '']) : super.dirty();

  static final RegExp _firstNameRegExp = RegExp(
    r'^[a-zA-Z]{2,20}$',
  );

  @override
  FirstNameValidationError? validator(String? value) {
    return _firstNameRegExp.hasMatch(value ?? '')
        ? null
        : FirstNameValidationError.invalid;
  }
}
