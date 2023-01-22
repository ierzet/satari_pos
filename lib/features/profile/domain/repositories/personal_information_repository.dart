import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/profile/domain/entities/personal_information.dart';

class PersonalInformationRepository {
  final _personalInformationCollectionReference =
      FirebaseFirestore.instance.collection(personalInformationCollection);

  Future<void> createPersonalInformation({
    required final String firstName,
    required final String lastName,
    required final String email,
    required final String address,
    required final String dateOfBirth,
    required final String phoneNumber,
    required final String postalCode,
    required final String gender,
  }) async {
    try {
      await _personalInformationCollectionReference.doc(email).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'postalCode': postalCode,
        'gender': gender,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updatePersonalInformation({
    required final String firstName,
    required final String lastName,
    required final String email,
    required final String address,
    required final String dateOfBirth,
    required final String phoneNumber,
    required final String postalCode,
    required final String gender,
  }) async {
    try {
      await _personalInformationCollectionReference.doc(email).update({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'postalCode': postalCode,
        'gender': gender,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PersonalInformation> getPersonalinformation({
    required final String email,
  }) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await _personalInformationCollectionReference.doc(email).get();
      final data = documentSnapshot.data() as Map<String, dynamic>;
      return PersonalInformation.fromJson(data, documentSnapshot.id);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
      return PersonalInformation.empty;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
