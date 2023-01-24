import 'package:equatable/equatable.dart';

abstract class PersonalInformationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetInitialPersonalInformation extends PersonalInformationEvent {}

class CreatePersonalInformation extends PersonalInformationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String dateOfBirth;
  final String phoneNumber;
  final String postalCode;
  final String gender;

  CreatePersonalInformation(
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.dateOfBirth,
    this.phoneNumber,
    this.postalCode,
    this.gender,
  );
  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        address,
        dateOfBirth,
        phoneNumber,
        postalCode,
        gender,
      ];
}

class UpdatePersonalInformation extends PersonalInformationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String dateOfBirth;
  final String phoneNumber;
  final String postalCode;
  final String gender;

  UpdatePersonalInformation(
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.dateOfBirth,
    this.phoneNumber,
    this.postalCode,
    this.gender,
  );
  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        address,
        dateOfBirth,
        phoneNumber,
        postalCode,
        gender,
      ];
}

class GetDataPersonalInformation extends PersonalInformationEvent {
  final String email;

  GetDataPersonalInformation(this.email);

  @override
  List<Object> get props => [email];
}

class DeleteForPersonalInformation extends PersonalInformationEvent {}

class FirstNameChanged extends PersonalInformationEvent {
  final String firstName;

  FirstNameChanged(this.firstName);

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends PersonalInformationEvent {
  final String lastName;

  LastNameChanged(this.lastName);

  @override
  List<Object> get props => [lastName];
}

class DateOfBirthChanged extends PersonalInformationEvent {
  final String dateOfBirth;

  DateOfBirthChanged(this.dateOfBirth);

  @override
  List<Object> get props => [dateOfBirth];
}

class AddressChanged extends PersonalInformationEvent {
  final String address;

  AddressChanged(this.address);

  @override
  List<Object> get props => [address];
}

class PhoneNumberChanged extends PersonalInformationEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class PostalCodeChanged extends PersonalInformationEvent {
  final String postalCode;

  PostalCodeChanged(this.postalCode);

  @override
  List<Object> get props => [postalCode];
}
