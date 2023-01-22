import 'package:formz/formz.dart';

enum DateOfBirthValidationError { invalid }

class DateOfBirth extends FormzInput<String, DateOfBirthValidationError> {
  const DateOfBirth.pure() : super.pure('');
  const DateOfBirth.dirty([super.value = '']) : super.dirty();

  static final RegExp _dateOfBirthRegExp = RegExp(
      r'^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$');

  @override
  DateOfBirthValidationError? validator(String? value) {
    return _dateOfBirthRegExp.hasMatch(value ?? '')
        ? null
        : DateOfBirthValidationError.invalid;
  }
}
