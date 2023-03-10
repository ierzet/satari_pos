import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/profile/domain/entities/personal_information.dart';
import 'package:satari_pos/features/profile/presentation/bloc/bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_event.dart';
import 'package:satari_pos/features/profile/presentation/widgets/object_widget/content_header_text.dart';

class Profile extends StatelessWidget {
  final String state;
  const Profile({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuProfile personalInformation = MenuProfile(
      title: 'Personal Information',
      icon: Icons.person,
      onTap: () {
        context.read<ProfileNavBloc>().add(PersonalInformationNavEvent());
      },
      rightBorderSide: state == 'PersonalInformationNavState'
          ? BorderSide(width: defaultPaddingHalf / 2, color: primaryColor)
          : BorderSide.none,
    );
    MenuProfile loginAndPassword = MenuProfile(
      title: 'Login and Password',
      icon: Icons.lock,
      onTap: () {
        context.read<ProfileNavBloc>().add(LoginAndPasswordNavEvent());
      },
      rightBorderSide: state == 'LoginAndPasswordNavState'
          ? BorderSide(width: defaultPaddingHalf / 2, color: primaryColor)
          : BorderSide.none,
    );
    MenuProfile notification = MenuProfile(
      title: 'Notification',
      icon: Icons.notifications,
      onTap: () {
        context.read<ProfileNavBloc>().add(NotificationNavEvent());
      },
      rightBorderSide: state == 'NotificationNavState'
          ? BorderSide(width: defaultPaddingHalf / 2, color: primaryColor)
          : BorderSide.none,
    );
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(defaultPadding, 0, 0, defaultPadding),
              padding: EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const ContentHeaderTextWidget(
                      titleText: 'Profile',
                    ),
                    SizedBox(
                      height: defaultPaddingQuadruple,
                    ),
                    CircleAvatar(
                      radius: defaultPaddingQuadruple,
                      backgroundImage:
                          const AssetImage('assets/image/profile_pic.png'),
                      backgroundColor: primaryColor,
                    ),
                    SizedBox(height: defaultPadding),
                    BlocBuilder<PersonalInformationBloc,
                        PersonalInformationState>(
                      builder: (context, state) {
                        if (state is PersonalInformationLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is PersonalInformationLoaded) {
                          final PersonalInformation personalInformationData =
                              state.personalInformation;
                          return Text(
                            '${personalInformationData.firstName} ${personalInformationData.lastName}',
                            style: GoogleFonts.lato(
                              fontSize: fontSizeFieldText,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    SizedBox(height: defaultPadding),
                    Text(
                      'Chief Technology Officer',
                      style: GoogleFonts.lato(
                        fontSize: fontSizeFieldText,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: defaultPaddingDouble),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Rp 350.000',
                              style: GoogleFonts.lato(
                                fontSize: fontSizeApp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: defaultPaddingHalf,
                            ),
                            Text(
                              'Earned',
                              style: GoogleFonts.lato(
                                fontSize: fontSizeFieldText,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        //TODO: masih kurang tengah garisnya mesti dipikirin gmn caranya
                        Container(
                          width: 1,
                          height: defaultPaddingTriple,
                          color: secondaryColor,
                        ),
                        SizedBox(height: defaultPaddingDouble),
                        Column(
                          children: [
                            Text(
                              '41',
                              style: GoogleFonts.lato(
                                fontSize: fontSizeApp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: defaultPaddingHalf,
                            ),
                            Text(
                              'Orders',
                              style: GoogleFonts.lato(
                                fontSize: fontSizeFieldText,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: defaultPadding * 0.5),
                    Divider(
                      height: defaultPadding,
                      indent: 5,
                      endIndent: 5,
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    SizedBox(height: defaultPadding),
                    personalInformation,
                    loginAndPassword,
                    notification,
                    SizedBox(height: defaultPaddingQuadruple),
                    Text(
                      'Delete Acccount',
                      style: GoogleFonts.lato(
                        color: primaryColor,
                        fontSize: fontSizeFieldText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.rightBorderSide,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final BorderSide rightBorderSide;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.amber[200],
        splashColor: Colors.amber[200],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: rightBorderSide,
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: defaultPadding * 1.25,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: fontSizeFieldText,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ));
  }
}
