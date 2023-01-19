import 'package:flutter/material.dart';
import 'package:satari_pos/core/util/constant.dart';

class TextInputFormWidget extends StatelessWidget {
  const TextInputFormWidget(
      {super.key,
      required this.keyField,
      required this.textInputType,
      required this.hintText,
      required TextEditingController controller});
  final String keyField;
  final TextInputType textInputType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: defaultPadding),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        key: Key(keyField),
        //TODO: ada null check disini
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

class DateInputFormWidget extends StatelessWidget {
  const DateInputFormWidget(
      {super.key,
      required this.keyField,
      required this.textInputType,
      required this.hintText});
  final String keyField;
  final TextInputType textInputType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: defaultPadding),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onTap: () => () async {},
        key: Key(keyField),
        //TODO: ada null check disini
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          icon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
