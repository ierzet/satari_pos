import 'package:flutter/material.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/profile/presentation/widgets/object_widget/field_text_widget.dart';

class SaveChangesButtonWidget extends StatelessWidget {
  const SaveChangesButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          key: const Key('save_changes_personal_information_raisedButton'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {},
          child: const ButtonFormTextWidget(
            titleText: 'Save Changes',
          )),
    );
  }
}
