import 'package:flashcard/viewmodel/extensions/size_ext.dart';
import 'package:flutter/material.dart';

class UIFont {
  static TextStyle fontApp(double size, Color color,
      {TextDecoration? decoration,
      double decorationThickness = 2,
      double underlineSpace = 2,
      double? height}) {
    if (decoration != null) {
      return TextStyle(
          fontFamily: "SVN",
          fontSize: size,
          color: Colors.transparent,
          shadows: [Shadow(offset: Offset(0, -underlineSpace.dp()), color: color)],
          decoration: decoration,
          decorationThickness: decorationThickness.dp(),
          decorationColor: color);
    }
    return TextStyle(
        fontFamily: "SVN", fontSize: size, color: color, height: height);
  }

  static TextStyle fontAppBold(double size, Color color,
      {TextDecoration? decoration,
      double decorationThickness = 2,
      double underlineSpace = 2,
      double? height}) {
    if (decoration != null) {
      return TextStyle(
          fontFamily: "SVN",
          fontSize: size,
          color: Colors.transparent,
          shadows: [Shadow(offset: Offset(0, -underlineSpace.dp()), color: color)],
          fontWeight: FontWeight.bold,
          decoration: decoration,
          decorationThickness: decorationThickness.dp(),
          decorationColor: color);
    }
    return TextStyle(
        fontFamily: "SVN",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
        height: height);
  }

  static TextStyle fontFrance(double size, Color color,
      {TextDecoration? decoration,
        double decorationThickness = 2,
        double underlineSpace = 2,
        double? height}) {
    if (decoration != null) {
      return TextStyle(
          fontFamily: "FRANCE",
          fontSize: size,
          color: Colors.transparent,
          shadows: [Shadow(offset: Offset(0, -underlineSpace.dp()), color: color)],
          decoration: decoration,
          decorationThickness: decorationThickness.dp(),
          decorationColor: color);
    }
    return TextStyle(
        fontFamily: "FRANCE",fontSize: size, color: color, height: height);
  }

  static TextStyle fontFranceBold(double size, Color color,
      {TextDecoration? decoration,
        double decorationThickness = 2,
        double underlineSpace = 2,
        double? height}) {
    if (decoration != null) {
      return TextStyle(
          fontFamily: "FRANCE",
          fontSize: size,
          color: Colors.transparent,
          shadows: [Shadow(offset: Offset(0, -underlineSpace.dp()), color: color)],
          fontWeight: FontWeight.bold,
          decoration: decoration,
          decorationThickness: decorationThickness.dp(),
          decorationColor: color);
    }
    return TextStyle(
        fontFamily: "FRANCE",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
        height: height);
  }
}
