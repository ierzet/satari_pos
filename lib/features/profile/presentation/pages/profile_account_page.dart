import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/personal_information_state.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/personal_information_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/content_widget/profile_widget.dart';

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
                return const PersonalInformation();
              }
            },
          ),
        ],
      ),
    );
  }
}
