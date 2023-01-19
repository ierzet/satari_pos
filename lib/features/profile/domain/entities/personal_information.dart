import 'package:equatable/equatable.dart';

class PersonalInformation extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String dateOfBirth;
  final String phoneNumber;
  final String postalCode;

  const PersonalInformation({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.postalCode,
  });

  static const empty = PersonalInformation(
      firstName: '',
      lastName: '',
      email: '',
      address: '',
      dateOfBirth: '',
      phoneNumber: '',
      postalCode: '');

  bool get isEmpty => this == PersonalInformation.empty;
  bool get isNotEmpty => this != PersonalInformation.empty;

  factory PersonalInformation.fromJson(Map<String, dynamic> json, String idx) {
    return PersonalInformation(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      dateOfBirth: json['dateOfBirth'],
      phoneNumber: json['phoneNumber'],
      postalCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'postalCode': postalCode,
      };

  PersonalInformation copyWith(
      {String? firstName,
      String? lastName,
      String? email,
      String? address,
      String? dateOfBirth,
      String? phoneNumber,
      String? postalCode}) {
    return PersonalInformation(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      postalCode: postalCode ?? this.postalCode,
    );
  }

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
