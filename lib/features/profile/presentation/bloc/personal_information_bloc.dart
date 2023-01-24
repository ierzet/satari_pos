import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:satari_pos/features/profile/data/models/first_name.dart';

import 'package:satari_pos/features/profile/domain/repositories/personal_information_repository.dart';
import 'package:satari_pos/features/profile/presentation/bloc/bloc.dart';

class PersonalInformationBloc
    extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  final PersonalInformationRepository personalInformationRepository;

  PersonalInformationBloc({
    required this.personalInformationRepository,
  }) : super(InitialPersonalInformation()) {
    on<CreatePersonalInformation>((event, emit) async {
      emit(PersonalInformationAdding());
      await Future.delayed(const Duration(milliseconds: 100));
      try {
        await personalInformationRepository.createPersonalInformation(
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            address: event.address,
            dateOfBirth: event.dateOfBirth,
            phoneNumber: event.phoneNumber,
            postalCode: event.postalCode,
            gender: event.gender);

        emit(PersonalInformationAdded());
      } catch (e) {
        emit(PersonalInformationError(e.toString()));
      }
    });

    on<UpdatePersonalInformation>((event, emit) async {
      emit(PersonalInformationUpdating());
      await Future.delayed(const Duration(milliseconds: 100));
      try {
        await personalInformationRepository.updatePersonalInformation(
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            address: event.address,
            dateOfBirth: event.dateOfBirth,
            phoneNumber: event.phoneNumber,
            postalCode: event.postalCode,
            gender: event.gender);

        emit(PersonalInformationUpdated());
      } catch (e) {
        emit(PersonalInformationError(e.toString()));
      }
    });

    on<GetDataPersonalInformation>((event, emit) async {
      emit(PersonalInformationLoading());
      await Future.delayed(const Duration(milliseconds: 100));
      try {
        final personalInformationData = await personalInformationRepository
            .getPersonalinformation(email: event.email.toString());
        print('coba cek personalInformationData: $personalInformationData');
        emit(PersonalInformationLoaded(personalInformationData));
      } catch (e) {
        emit(PersonalInformationError(e.toString()));
      }
    });

    on<SetInitialPersonalInformation>((event, emit) async {
      emit(InitialPersonalInformation());
      await Future.delayed(const Duration(milliseconds: 100));
      try {
        emit(PersonalInformationEmpty());
      } catch (e) {
        emit(PersonalInformationError(e.toString()));
      }
    });
/*
    on<FirstNameChanged>((event, emit) {
      emit(PersonalInformationValidation());
      final firstName = FirstName.dirty(event.firstName);
      final currentState = state as PersonalInformationValidation;
      try {
        emit(currentState.copyWith(
          firstName: firstName,
          status: Formz.validate([firstName, currentState.firstName]),
        ));
      } catch (e) {
        emit(PersonalInformationError(e.toString()));
      }
    });
*/
    on<LastNameChanged>((event, emit) {});

    on<DateOfBirthChanged>((event, emit) {});

    on<AddressChanged>((event, emit) {});

    on<PhoneNumberChanged>((event, emit) {});

    on<PostalCodeChanged>((event, emit) {});
  }
}
