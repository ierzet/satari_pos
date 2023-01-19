import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class PersonalInformationRepository {
  final personalInformationRepo =
      FirebaseFirestore.instance.collection('PersonalInformation');

  Future<void> createPersonalInformation({
    required final String firstName,
    required final String lastName,
    required final String email,
    required final String address,
    required final String dateOfBirth,
    required final String phoneNumber,
    required final String postalCode,
  }) async {
    try {
      await personalInformationRepo.add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'postalCode': postalCode,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
