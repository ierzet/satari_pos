import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_bloc.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_state.dart';
import 'package:satari_pos/features/home/presentation/widgets/side_menu_widget/side_menu.dart';
import 'package:satari_pos/features/profile/presentation/cubit/menu_personal_information_cubit.dart';
import 'package:satari_pos/features/profile/presentation/pages/profile_page.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/bill_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/menu_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/settings_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/statistic_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/window_time_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static Page<void> page() => const MaterialPage<void>(child: Home());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryColor,
      body: Row(children: <Widget>[
        const Expanded(child: SideMenu()),
        Expanded(
          flex: 5,
          child: BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              if (state is ProfileAccountState) {
                return const ProfilePage();
              } else if (state is BillState) {
                return const BillWidget();
              } else if (state is StatisticState) {
                return const StatisticWidget();
              } else if (state is WindowTimeState) {
                return const WindowTimeWidget();
              } else if (state is SettingsState) {
                return const SettingsWidget();
              } else if (state is MenuState) {
                return const MenuWidget();
              } else {
                return const ProfilePage();
              }
            },
          ),
        )
      ]),
    );
  }
}
