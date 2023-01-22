import 'package:formz/formz.dart';

enum LastNameValidationError { invalid }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure() : super.pure('');
  const LastName.dirty([super.value = '']) : super.dirty();

  static final RegExp _lastNameRegExp = RegExp(
    r'^[a-zA-Z]{2,20}$',
  );

  @override
  LastNameValidationError? validator(String? value) {
    return _lastNameRegExp.hasMatch(value ?? '')
        ? null
        : LastNameValidationError.invalid;
  }
}
