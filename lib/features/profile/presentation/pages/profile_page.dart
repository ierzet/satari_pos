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
          const Profile(),
          BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
            builder: (context, state) {
              if (state is PersonalInformationAdding) {
                return const CircularProgressIndicator();
              } else if (state is PersonalInformationError) {
                return const Center(child: Text('Error'));
              } else {
                return BlocBuilder<ProfileNavBloc, ProfileNavState>(
                  builder: (context, state) {
                    if (state is PersonalInformationNavState) {
                      return const PersonalInformation();
                    } else if (state is LoginAndPasswordNavState) {
                      return const LoginAndPassword();
                    } else if (state is NotificationNavState) {
                      return const NotificationProfile();
                    }
                    return const PersonalInformation();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}




/*




 if (state == PersonalInformationNavState) {
                return const Profile();
              } else if (state == LoginAndPasswordNavState) {
                return const LoginAndPassword();
              } else if (state == NotificationNavState) {
                return NotificationProfile();
              }
              return const Profile();

*/