import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:satari_pos/features/login/data/models/email.dart';
import 'package:satari_pos/features/profile/data/models/address.dart';
import 'package:satari_pos/features/profile/data/models/date_of_birth.dart';
import 'package:satari_pos/features/profile/data/models/first_name.dart';
import 'package:satari_pos/features/profile/data/models/last_name.dart';
import 'package:satari_pos/features/profile/data/models/phone_number.dart';
import 'package:satari_pos/features/profile/data/models/postal_code.dart';

class PersonalInformationFormState extends Equatable {
  const PersonalInformationFormState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.email = const Email.pure(),
    this.address = const Address.pure(),
    this.dateOfBirth = const DateOfBirth.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.postalCode = const PostalCode.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final FirstName firstName;
  final LastName lastName;
  final Email email;
  final Address address;
  final DateOfBirth dateOfBirth;
  final PhoneNumber phoneNumber;
  final PostalCode postalCode;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        address,
        dateOfBirth,
        phoneNumber,
        postalCode,
        status
      ];

  PersonalInformationFormState copyWith({
    FirstName? firstName,
    LastName? lastName,
    Email? email,
    Address? address,
    DateOfBirth? dateOfBirth,
    PhoneNumber? phoneNumber,
    PostalCode? postalCode,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return PersonalInformationFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      postalCode: postalCode ?? this.postalCode,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
