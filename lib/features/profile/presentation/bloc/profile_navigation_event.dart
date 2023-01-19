import 'package:meta/meta.dart';

@immutable
abstract class ProfileNavEvent {}

class PersonalInformationNavEvent extends ProfileNavEvent {}

class LoginAndPasswordNavEvent extends ProfileNavEvent {}

class NotificationNavEvent extends ProfileNavEvent {}

class DeleteProfileEvent extends ProfileNavEvent {}
