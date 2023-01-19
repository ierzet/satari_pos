import 'package:flutter/material.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/profile/presentation/widgets/object_widget/field_text_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/object_widget/header_text_widget.dart';
import 'package:satari_pos/features/profile/presentation/widgets/object_widget/text_input_form_widget.dart';

class LoginAndPassword extends StatelessWidget {
  const LoginAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _dateOfBirthController =
        TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();
    final TextEditingController _postalCodeController = TextEditingController();

    var _gender;
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
        child: Column(
          children: [
            const HeaderTextWidget(titleText: 'Login and Password'),
            SizedBox(height: defaultPaddingDouble),
            Row(
              children: [
                const FieldTextWidget(titleText: 'Male'),
                Radio(
                    activeColor: primaryColor,
                    value: 'male',
                    groupValue: _gender,
                    onChanged: (value) {}),
                const FieldTextWidget(titleText: 'Female'),
                Radio(
                    activeColor: primaryColor,
                    value: 'female',
                    groupValue: _gender,
                    onChanged: (value) {}),
              ],
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                const Expanded(child: FieldTextWidget(titleText: 'First Name')),
                SizedBox(width: defaultPadding),
                const Expanded(child: FieldTextWidget(titleText: 'Last Name')),
              ],
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: TextInputFormWidget(
                    controller: _firstNameController,
                    keyField: 'personal_information_first_name',
                    textInputType: TextInputType.name,
                    hintText: 'Erzet',
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: TextInputFormWidget(
                    controller: _lastNameController,
                    keyField: 'personal_information_last_name',
                    textInputType: TextInputType.name,
                    hintText: 'Satari',
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            const FieldTextWidget(titleText: 'Email'),
            SizedBox(height: defaultPadding),
            TextInputFormWidget(
              controller: _emailController,
              keyField: 'personal_information_email',
              textInputType: TextInputType.emailAddress,
              hintText: '. . .',
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                const Expanded(
                    child: FieldTextWidget(titleText: 'Phone Number')),
                SizedBox(width: defaultPadding),
                const Expanded(
                    child: FieldTextWidget(titleText: 'Date of Birth'))
              ],
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: TextInputFormWidget(
                    controller: _phoneNumberController,
                    keyField: 'personal_information_phone_number',
                    textInputType: TextInputType.phone,
                    hintText: '. . .',
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: TextInputFormWidget(
                    controller: _dateOfBirthController,
                    keyField: 'personal_information_date_of_birth',
                    textInputType: TextInputType.datetime,
                    hintText: '. . .',
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
                const Expanded(child: FieldTextWidget(titleText: 'Location')),
                SizedBox(width: defaultPadding),
                const Expanded(child: FieldTextWidget(titleText: 'Postal Code'))
              ],
            ),
            SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: TextInputFormWidget(
                    controller: _addressController,
                    keyField: 'personal_information_location',
                    textInputType: TextInputType.multiline,
                    hintText: '. . .',
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: TextInputFormWidget(
                    controller: _postalCodeController,
                    keyField: 'personal_information_postal_code',
                    textInputType: TextInputType.number,
                    hintText: '. . .',
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultPaddingDouble),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key:
                    const Key('save_changes_personal_information_raisedButton'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: () {},
                child: const ButtonFormTextWidget(
                  titleText: 'Save Changes',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
