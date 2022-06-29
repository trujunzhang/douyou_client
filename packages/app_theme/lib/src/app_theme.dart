import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

const kPrimaryColor = Color(0xFF68a523);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF000b1c);
const kContentColorDarkTheme = Colors.white;

// Create a custom flex color scheme for a light theme.
// static FlexSchemeColor myScheme1Light = FlexSchemeColor(
//   primary: Color(0xFF4E0028),
//   primaryVariant: Color(0xFF320019),
//   secondary: Color(0xFF003419),
//   secondaryVariant: Color(0xFF002411),
//   appBarColor: Color(0xFF002411),
// );

const FlexSchemeData customFlexScheme = FlexSchemeData(
  name: 'Toledo purple',
  description: 'Purple theme created from custom defined colors.',
  light: FlexSchemeColor(
      appBarColor: Colors.redAccent,
      primary: Colors.blue,
      primaryVariant: Colors.white,
      secondary: Colors.green,
      secondaryVariant: Colors.yellow),
  dark: FlexSchemeColor(
      appBarColor: Colors.cyanAccent,
      primary: Colors.blue,
      primaryVariant: Colors.black,
      secondary: Colors.white,
      secondaryVariant: Colors.purple),
);
