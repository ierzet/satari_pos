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

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({
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
                    Text('Personal Information',
                        style: GoogleFonts.lato(
                          fontSize: fontSizeApp,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(height: defaultPaddingDouble),
                BlocBuilder<GenderRadioCubit, String>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Male', style: textStyleNormal),
                          ],
                        ),
                        Radio(
                          activeColor: primaryColor,
                          value: 'male',
                          groupValue: state,
                          onChanged: (value) {
                            context
                                .read<GenderRadioCubit>()
                                .selectGender(value.toString());
                            if (value != null || value!.isNotEmpty) {
                              getGetnder = value.toString();
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Female', style: textStyleNormal),
                          ],
                        ),
                        Radio(
                          activeColor: primaryColor,
                          value: 'female',
                          groupValue: state,
                          onChanged: (value) {
                            context
                                .read<GenderRadioCubit>()
                                .selectGender(value.toString());
                            if (value != null || value!.isNotEmpty) {
                              getGetnder = value.toString();
                            }
                          },
                        ),
                        //Text(state),
                        Flexible(
                          child: TextField(
                            enabled: false,
                            controller: genderController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        /*Flexible(
                          child: Text(
                              'userPersonalInformation.toString() dan ${user.email.toString()}'),
                        ),*/
                      ],
                    );
                  },
                ),
                SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('First Name', style: textStyleNormal),
                        ],
                      ),
                    ),
                    SizedBox(width: defaultPadding),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Last Name', style: textStyleNormal),
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
                        child: TextField(
                          /*onChanged: (firstName) {
                            BlocProvider.of<PersonalInformationBloc>(context)
                                .add(FirstNameChanged(firstName));
                          },*/
                          enabled: true,
                          controller: firstNameController,
                          key: const Key('personal_information_first_name'),
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
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
                        child: TextField(
                          enabled: true,
                          controller: lastNameController,
                          key: const Key('personal_information_last_name'),
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
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
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Phone Number',
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
                            'Date of Birth',
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
                        child: TextField(
                          enabled: true,
                          controller: phoneNumberController,
                          key: const Key('personal_information_phone_number'),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
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
                        child: TextField(
                          enabled: true,
                          controller: dateOfBirthController,
                          key: const Key('personal_information_date_of_birth'),
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '. . .',
                          ),
                        ),
                      ),
                    ),
                    /* IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              initialDate: DateTime(1900),
                            );
                          },
                        )*/
                  ],
                ),
                SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
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
                            'Postal Code',
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
                        child: TextField(
                          enabled: true,
                          controller: addressController,
                          key: const Key('personal_information_location'),
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
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
                        child: TextField(
                          enabled: true,
                          controller: postalCodeController,
                          key: const Key('personal_information_postal_code'),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '. . .',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPaddingDouble),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key(
                        'save_changes_personal_information_raisedButton'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed: () {
                      updatePersonalInformation(context);
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
