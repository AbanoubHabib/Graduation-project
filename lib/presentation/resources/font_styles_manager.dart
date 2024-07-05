import 'package:flutter/material.dart';
import 'fonts_maneger.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'Montserrat',
    fontWeight: fontWeight,
    color: color,
  );
}

// Light
TextStyle getLightStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
// Regular
TextStyle getRegularStyle(
    {double fontSize = FontSizeManager.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
// Medium
TextStyle getMediumStyle(
    {double fontSize = FontSizeManager.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
// SemiBold
TextStyle getSemiBoldStyle(
    {double fontSize = FontSizeManager.s20, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
// Bold
TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s22, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
