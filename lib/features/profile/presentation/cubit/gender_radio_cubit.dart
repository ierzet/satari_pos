import 'package:flutter_bloc/flutter_bloc.dart';

class GenderRadioCubit extends Cubit<String> {
  GenderRadioCubit({this.initialData = ''}) : super(initialData);
  String initialData;
  String next = '';
  String current = '';

  selectGender(String gender) {
    emit(gender);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
  }
}
