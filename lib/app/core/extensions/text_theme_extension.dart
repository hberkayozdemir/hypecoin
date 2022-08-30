import 'package:flutter/material.dart';

extension HibemiTextStyle on BuildContext {
  TextTheme get hypeTextTheme => Theme.of(this).textTheme;
}

extension HibemiStyleEx on TextTheme {
  TextStyle get h1 =>
      headline1!.copyWith(fontSize: 64, fontWeight: FontWeight.w400);

  TextStyle get h2 =>
      headline2!.copyWith(fontSize: 48, fontWeight: FontWeight.w400);

  TextStyle get h3 =>
      headline3!.copyWith(fontSize: 32, fontWeight: FontWeight.w400);

  TextStyle get h4 =>
      headline4!.copyWith(fontSize: 24, fontWeight: FontWeight.w400);

  TextStyle get h5 =>
      headline5!.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get secondary =>
      headline5!.copyWith(fontSize: 22, fontWeight: FontWeight.w500);

  TextStyle get bodyL =>
      bodyLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.w400);

  TextStyle get bodyLEmphasis =>
      bodyLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.w500);

  TextStyle get bodyM =>
      bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get bodyMEmphasis =>
      bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get bodyS =>
      bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get bodySEmphasis =>
      bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500);

  TextStyle get bodyXS =>
      bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w400);

  TextStyle get bodyXSEmphasis =>
      bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.w500);

  TextStyle get button =>
      button.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get buttonExtraSmall =>
      button.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
}
