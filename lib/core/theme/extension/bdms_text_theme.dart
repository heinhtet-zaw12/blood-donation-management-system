import 'package:flutter/material.dart';

class BDMSTextTheme extends ThemeExtension<BDMSTextTheme> {
  final TextStyle title;
  final TextStyle subTitle;
  final TextStyle bodyRegular;
  final TextStyle tabText;

  BDMSTextTheme({
    required this.title,
    required this.subTitle,
    required this.bodyRegular,
    required this.tabText
  });
  @override
  ThemeExtension<BDMSTextTheme> copyWith({
    TextStyle? title,
    TextStyle? subTitle,
    TextStyle? bodyRegular,
    TextStyle? tabText,
  }) {
    return BDMSTextTheme(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      tabText:  tabText ?? this.tabText
    );
  }

  @override
  ThemeExtension<BDMSTextTheme> lerp(
      covariant ThemeExtension<BDMSTextTheme>? other, double t) {
    return BDMSTextTheme(
      title: title,
      subTitle: subTitle,
      bodyRegular: bodyRegular,
      tabText:  tabText
    );
  }
}