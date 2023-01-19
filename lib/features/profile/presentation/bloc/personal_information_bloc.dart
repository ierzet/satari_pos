import 'package:flutter_bloc/flutter_bloc.dart';
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
      await Future.delayed(const Duration(seconds: 1));
      try {
        await personalInformationRepository.createPersonalInformation(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          address: event.address,
          dateOfBirth: event.dateOfBirth,
          phoneNumber: event.phoneNumber,
          postalCode: event.postalCode,
        );

        emit(PersonalInformationAdded());
      } catch (e) {
        emit(PersonalInformationError(e.toString()));
      }
    });
  }
}
