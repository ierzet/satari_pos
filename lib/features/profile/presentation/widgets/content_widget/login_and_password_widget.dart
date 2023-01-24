import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/login/presentation/bloc/app_bloc.dart';
import 'package:satari_pos/features/profile/domain/entities/personal_information.dart';

import 'package:satari_pos/features/profile/presentation/bloc/bloc.dart';
import 'package:satari_pos/features/profile/presentation/cubit/gender_radio_cubit.dart';
import 'package:satari_pos/features/profile/presentation/widgets/object_widget/field_text_widget.dart';

class LoginAndPassword extends StatelessWidget {
  const LoginAndPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('aku ada berapa');
    }

    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController postalCodeController = TextEditingController();
    final TextEditingController genderController = TextEditingController();

    final user = context.select((AppBloc bloc) => bloc.state.user);
    final userPersonalInformation =
        context.select((PersonalInformationBloc bloc) => bloc.state.toString());

    String? getGetnder;

    void postPersonalInformation(context) {
      BlocProvider.of<PersonalInformationBloc>(context).add(
        CreatePersonalInformation(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          addressController.text,
          dateOfBirthController.text,
          phoneNumberController.text,
          postalCodeController.text,
          getGetnder.toString(),
        ),
      );
      //print('gender: ${getGetnder.toString()}');
    }

    void updatePersonalInformation(context) {
      BlocProvider.of<PersonalInformationBloc>(context).add(
        UpdatePersonalInformation(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          addressController.text,
          dateOfBirthController.text,
          phoneNumberController.text,
          postalCodeController.text,
          getGetnder.toString(),
        ),
      );
      //print('gender: ${getGetnder.toString()}');
    }

    return Flexible(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(defaultPadding),
        padding: EdgeInsets.all(defaultPaddingDouble),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
          builder: (context, state) {
            //print('state: $state');
            //print('email masuk ga: ${user.email.toString()}');
            if (state is PersonalInformationEmpty) {
              BlocProvider.of<PersonalInformationBloc>(context)
                  .add(GetDataPersonalInformation(user.email.toString()));
            }
            if (state is PersonalInformationUpdated) {
              BlocProvider.of<PersonalInformationBloc>(context)
                  .add(GetDataPersonalInformation(user.email.toString()));
            }
            if (state is PersonalInformationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PersonalInformationLoaded) {
              PersonalInformation personalInformationData =
                  state.personalInformation;
              firstNameController.text = personalInformationData.firstName;
              lastNameController.text = personalInformationData.lastName;
              emailController.text = personalInformationData.email;
              phoneNumberController.text = personalInformationData.phoneNumber;
              dateOfBirthController.text = personalInformationData.dateOfBirth;
              addressController.text = personalInformationData.address;
              postalCodeController.text = personalInformationData.postalCode;
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Login and Password',
                        style: GoogleFonts.lato(
                          fontSize: fontSizeApp,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(height: defaultPaddingTriple),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.lato(
                        fontSize: fontSizeFieldText,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: defaultPadding),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    enabled: false,
                    controller: emailController,
                    key: const Key('personal_information_email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '. . .',
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.lato(
                        fontSize: fontSizeFieldText,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: defaultPadding),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    enabled: false,
                    //controller: passwordController,
                    key: Key('personal_information_password'),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '. . .',
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'New Password',
                            style: GoogleFonts.lato(
                              fontSize: fontSizeFieldText,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: defaultPadding),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm New Password',
                            style: GoogleFonts.lato(
                              fontSize: fontSizeFieldText,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: defaultPadding),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          enabled: true,
                          //controller: phoneNumberController,
                          key: Key('personal_information_new_password'),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '. . .',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: defaultPadding),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: defaultPadding),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          enabled: true,
                          //controller: dateOfBirthController,
                          key: Key('personal_information_confirm_new_password'),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '. . .',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Role',
                      style: GoogleFonts.lato(
                        fontSize: fontSizeFieldText,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: defaultPadding),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    enabled: false,
                    //controller: passwordController,
                    key: Key('personal_information_role'),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '. . .',
                    ),
                  ),
                ),
                SizedBox(height: defaultPaddingDouble),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key(
                        'save_changes_login_and_password_raisedButton'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed: () {
                      //updatePersonalInformation(context);
                    },
                    child: const ButtonFormTextWidget(
                      titleText: 'Save Changes',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
