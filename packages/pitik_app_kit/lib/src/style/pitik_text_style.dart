import 'package:flutter/material.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class PitikTextStyle {
  PitikTextStyle._();

  static TextStyle _base({
    int fontSize = 14,
    Color? color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration? decoration,
    String fontFamily = 'Montserrat_Medium',
  }) =>
      TextStyle(fontSize: fontSize * 1.sp, color: color, fontWeight: fontWeight, decoration: decoration, fontFamily: fontFamily);

  static TextStyle custom({
    int fontSize = 14,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration? decoration,
    double? height,
    double? letterSpacing,
  }) =>
      _base(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle heading3xl({
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 48,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle heading2xl({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 40,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle headingXl({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 32,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle headingLg({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 24,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle heading({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 20,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle headingSm({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 18,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle headingXs({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
  static TextStyle labelLg({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle label({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
  static TextStyle labelSm({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle bodyLg({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle body({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration? decoration,
  }) =>
      _base(
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle bodySm({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static TextStyle bodyXs({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration? decoration,
  }) =>
      _base(
        fontSize: 10,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );

  static FontWeight get bold => FontWeight.bold;
  static FontWeight get semiBold => FontWeight.w600;
  static FontWeight get medium => FontWeight.w500;
  static FontWeight get regular => FontWeight.w400;
}
