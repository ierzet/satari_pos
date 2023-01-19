import 'package:flutter/material.dart';
import 'package:satari_pos/core/util/constant.dart';

class ContentHeaderTextWidget extends StatelessWidget {
  const ContentHeaderTextWidget({super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(titleText, style: textStyleContentHeader),
      ],
    );
  }
}
