import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*
Color primaryColor = const Color.fromARGB(1000, 238, 140, 33);
Color secondaryColor = const Color.fromARGB(1000, 238, 238, 238);
Color thirdColor = const Color.fromARGB(1000, 38, 41, 48);
Color backgroundColor = const Color.fromARGB(1000, 254, 254, 254);
*/

Color primaryColor = const Color.fromARGB(1000, 238, 140, 33);
Color secondaryColor = const Color.fromARGB(251, 238, 238, 238);
Color thirdColor = const Color.fromARGB(1000, 38, 41, 48);
Color backgroundColor = const Color.fromARGB(255, 254, 254, 254);

double fontSizeApp = 20;
double fontSizeFieldText = 16;
double fontSizeHeaderFormText = 32;
double fontSizeContentHeader = 40;

double defaultPaddingHalf = defaultPadding / 2;
double defaultPadding = 16;
double defaultPaddingDouble = defaultPadding * 2;
double defaultPaddingTriple = defaultPadding * 3;
double defaultPaddingQuadruple = defaultPadding * 4;

TextStyle textStyleNormal = GoogleFonts.lato(
  fontSize: fontSizeFieldText,
  fontWeight: FontWeight.normal,
);
TextStyle textStyleBold = GoogleFonts.lato(
  fontSize: fontSizeFieldText,
  fontWeight: FontWeight.bold,
);
TextStyle textStyleLite = GoogleFonts.lato(
  fontSize: fontSizeFieldText,
  fontWeight: FontWeight.w300,
);
TextStyle textStyleHeader = GoogleFonts.lato(
  fontSize: fontSizeApp,
  fontWeight: FontWeight.w300,
);
TextStyle textStyleContentHeader = GoogleFonts.lato(
  fontSize: fontSizeContentHeader,
  fontWeight: FontWeight.bold,
);

Widget logo = Image.asset(
  'assets/image/Asset 8.png',
  scale: 1,
);

String personalInformationCollection = 'PersonalInformation';
/*
Color primaryColor = Colors.red;
Color secondaryColor = Colors.red;
Color thirdColor = Colors.red;
Color backgroundColor = Colors.red;

double defaultPadding = 16;*/
