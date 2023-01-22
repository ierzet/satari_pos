import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:satari_pos/features/profile/data/models/first_name.dart';
import 'package:satari_pos/features/profile/domain/repositories/personal_information_repository.dart';

import 'package:satari_pos/features/profile/presentation/cubit/personal_information_form_state.dart';

class PersonalInformationFormCubit extends Cubit<PersonalInformationFormState> {
  PersonalInformationFormCubit(this._personalInformationRepository)
      : super(const PersonalInformationFormState());

  final PersonalInformationRepository _personalInformationRepository;

  void firstNameChanged(String value) {
    final firstName = FirstName.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        status: Formz.validate([firstName, state.firstName]),
      ),
    );
  }

  Future<void> addToPersonalInformationBloc() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
  }
}
