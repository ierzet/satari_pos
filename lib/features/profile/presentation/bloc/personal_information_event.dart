import 'package:equatable/equatable.dart';

abstract class PersonalInformationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreatePersonalInformation extends PersonalInformationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String dateOfBirth;
  final String phoneNumber;
  final String postalCode;

  CreatePersonalInformation(
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.dateOfBirth,
    this.phoneNumber,
    this.postalCode,
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
      ];
}

class GetDataPersonalInfirmation extends PersonalInformationEvent {
  //GetDataPersonalInformation();
}

class DeleteForPersonalInformation extends PersonalInformationEvent {}
