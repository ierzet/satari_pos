import 'package:formz/formz.dart';

enum AddressValidationError { invalid }

class Address extends FormzInput<String, AddressValidationError> {
  const Address.pure() : super.pure('');
  const Address.dirty([super.value = '']) : super.dirty();

  static final RegExp _locationRegExp = RegExp(r'^[a-zA-Z0-9\s\.\?,!]*$');

  @override
  AddressValidationError? validator(String? value) {
    return _locationRegExp.hasMatch(value ?? '')
        ? null
        : AddressValidationError.invalid;
  }
}
