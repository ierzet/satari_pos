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
}

class DeleteForPersonalInformation extends PersonalInformationEvent {}

/*
class SetInitialPersonalInformation extends PersonalInformationEvent {
  final String email;

  SetInitialPersonalInformation(this.email);}
  */

