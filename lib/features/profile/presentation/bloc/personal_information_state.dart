import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:satari_pos/features/profile/data/models/first_name.dart';
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

class FirstNameValidation extends PersonalInformationState {
  @override
  List<Object> get props => [];
}
