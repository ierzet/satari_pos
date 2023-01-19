import 'package:bloc/bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_event.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_state.dart';

class ProfileNavBloc extends Bloc<ProfileNavEvent, ProfileNavState> {
  ProfileNavBloc() : super(PersonalInformationNavState()) {
    on<PersonalInformationNavEvent>(
        (event, emit) => emit(PersonalInformationNavState()));
    on<LoginAndPasswordNavEvent>(
        (event, emit) => emit(LoginAndPasswordNavState()));
    on<NotificationNavEvent>((event, emit) => emit(NotificationNavState()));
  }
}
