import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satari_pos/core/util/constant.dart';

class FieldTextWidget extends StatelessWidget {
  const FieldTextWidget({super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(titleText, style: textStyleNormal),
      ],
    );
  }
}

class ButtonFormTextWidget extends StatelessWidget {
  const ButtonFormTextWidget({super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: GoogleFonts.lato(
            fontSize: fontSizeFieldText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
