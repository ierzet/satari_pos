import 'package:flutter_bloc/flutter_bloc.dart';

class RightBorderCubit extends Cubit<bool> {
  RightBorderCubit() : super(true);
  changeBorder(option) {
    emit(!state);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
  }
}
