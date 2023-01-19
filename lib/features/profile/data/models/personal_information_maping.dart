import 'package:satari_pos/features/profile/domain/entities/personal_information.dart';

class PersonalInformationMaping extends PersonalInformation {
  const PersonalInformationMaping({
    required firstName,
    required lastName,
    required email,
    required address,
    required dateOfBirth,
    required phoneNumber,
    required postalCode,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          address: address,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber,
          postalCode: postalCode,
        );

  factory PersonalInformationMaping.fromJson(Map<String, dynamic> json) {
    return PersonalInformationMaping(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      dateOfBirth: json['dateOfBirth'],
      phoneNumber: json['phoneNumber'],
      postalCode: json['postalCode'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'postalCode': postalCode,
    };
  }
}
