import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:satari_pos/features/login/data/models/email.dart';
import 'package:satari_pos/features/profile/data/models/address.dart';
import 'package:satari_pos/features/profile/data/models/date_of_birth.dart';
import 'package:satari_pos/features/profile/data/models/first_name.dart';
import 'package:satari_pos/features/profile/data/models/last_name.dart';
import 'package:satari_pos/features/profile/data/models/phone_number.dart';
import 'package:satari_pos/features/profile/data/models/postal_code.dart';
import 'package:satari_pos/features/profile/domain/entities/personal_information.dart';

abstract class PersonalInformationState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialPersonalInformation extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationEmpty extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationAdding extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationAdded extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationUpdating extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationUpdated extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationLoading extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationLoaded extends PersonalInformationState {
  final PersonalInformation personalInformation;

  PersonalInformationLoaded(this.personalInformation);

  @override
  List<Object> get props => [personalInformation];
}

class PersonalInformationDeleting extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationDeleted extends PersonalInformationState {
  @override
  List<Object> get props => [];
}

class PersonalInformationError extends PersonalInformationState {
  final String message;

  PersonalInformationError(this.message);

  @override
  List<Object> get props => [message];
}

class PersonalInformationValidation extends PersonalInformationState {
  final FirstName firstName;
  final LastName lastName;
  final Email email;
  final Address address;
  final DateOfBirth dateOfBirth;
  final PhoneNumber phoneNumber;
  final PostalCode postalCode;
  final FormzStatus status;
  final String? errorMessage;

  PersonalInformationValidation({
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

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        address,
        dateOfBirth,
        phoneNumber,
        postalCode,
        status,
      ];

  PersonalInformationValidation copyWith({
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
    return PersonalInformationValidation(
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
