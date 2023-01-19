import 'package:bloc/bloc.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_event.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ProfileAccountState()) {
    on<ProfileAccountEvent>((event, emit) => emit(ProfileAccountState()));
    on<MenuEvent>((event, emit) => emit(MenuState()));
    on<StatisticEvent>((event, emit) => emit(StatisticState()));
    on<BillEvent>((event, emit) => emit(BillState()));
    on<WindowTimeEvent>((event, emit) => emit(WindowTimeState()));
    on<SettingsEvent>((event, emit) => emit(SettingsState()));
    on<PresenceEvent>((event, emit) => emit(PresenceState()));
  }
}
