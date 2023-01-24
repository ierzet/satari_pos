import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/personal_information_state.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_state.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/login_and_password_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/personal_information_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/profile_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/notification_widget.dart';

//TODO:rapihin widget text => penamaanya Text.......Widget()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          BlocBuilder<ProfileNavBloc, ProfileNavState>(
            builder: (context, state) {
              if (state is PersonalInformationNavState) {
                return const Profile(state: 'PersonalInformationNavState');
              } else if (state is LoginAndPasswordNavState) {
                return const Profile(state: 'LoginAndPasswordNavState');
              } else if (state is NotificationNavState) {
                return const Profile(state: 'NotificationNavState');
              } else {
                return const Profile(
                  state: 'PersonalInformationNavState',
                );
              }
            },
          ),
          BlocBuilder<ProfileNavBloc, ProfileNavState>(
            builder: (context, state) {
              if (state is PersonalInformationNavState) {
                return const PersonalInformationWidget();
              } else if (state is LoginAndPasswordNavState) {
                return const LoginAndPassword();
              } else if (state is NotificationNavState) {
                return const NotificationProfile();
              }
              return const PersonalInformationWidget();
            },
          ),
        ],
      ),
    );
  }
}
