import 'package:formz/formz.dart';

enum PostalCodeValidationError { invalid }

class PostalCode extends FormzInput<String, PostalCodeValidationError> {
  const PostalCode.pure() : super.pure('');
  const PostalCode.dirty([super.value = '']) : super.dirty();

  static final RegExp _postalCodeRegExp = RegExp(r'^\d{5}$');

  @override
  PostalCodeValidationError? validator(String? value) {
    return _postalCodeRegExp.hasMatch(value ?? '')
        ? null
        : PostalCodeValidationError.invalid;
  }
}
