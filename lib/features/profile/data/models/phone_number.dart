import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  static final RegExp _phoneNumberRegExp = RegExp(
      r'^(?:(?:\+?62|0)[1-9]{1}[0-9]{7,11}|(?:62|0)[1-9]{1}[0-9]{7,11})$');

  @override
  PhoneNumberValidationError? validator(String? value) {
    return _phoneNumberRegExp.hasMatch(value ?? '')
        ? null
        : PhoneNumberValidationError.invalid;
  }
}
