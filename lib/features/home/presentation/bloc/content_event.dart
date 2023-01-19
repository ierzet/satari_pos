// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
abstract class ContentEvent {}

class ProfileAccountEvent extends ContentEvent {}

class MenuEvent extends ContentEvent {}

class BillEvent extends ContentEvent {}

class StatisticEvent extends ContentEvent {}

class WindowTimeEvent extends ContentEvent {}

class SettingsEvent extends ContentEvent {}

class PresenceEvent extends ContentEvent {}
