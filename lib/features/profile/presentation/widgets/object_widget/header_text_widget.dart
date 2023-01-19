import 'package:flutter/material.dart';
import 'package:satari_pos/core/util/constant.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(titleText, style: textStyleHeader),
      ],
    );
  }
}
