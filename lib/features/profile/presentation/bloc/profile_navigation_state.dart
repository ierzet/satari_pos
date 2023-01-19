import 'package:meta/meta.dart';

@immutable
abstract class ProfileNavState {}

class PersonalInformationNavState extends ProfileNavState {}

class LoginAndPasswordNavState extends ProfileNavState {}

class NotificationNavState extends ProfileNavState {}

class DeleteProfileState extends ProfileNavState {}
