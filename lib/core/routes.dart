import 'package:flutter/widgets.dart';
import 'package:satari_pos/features/home/presentation/pages/home.dart';
import 'package:satari_pos/features/login/presentation/bloc/app_bloc.dart';

import 'package:satari_pos/features/login/presentation/widgets/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  //print(state);
  switch (state) {
    case AppStatus.authenticated:
      return [Home.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
