import 'package:flutter/material.dart';

@immutable
class BDMSColors extends ThemeExtension<BDMSColors> {
  final Color? textPrimary;
  final Color? darkPrimary;
  final Color? background;
  final Color? disabled;
  final Color? success;

  const BDMSColors({
    required this.textPrimary,
    required this.darkPrimary,
    required this.background,
    required this.disabled,
    required this.success,
  });

  @override
  BDMSColors copyWith({Color? textPrimary, Color? darkPrimary,Color? background ,Color? disabled, Color? success}) {
    return BDMSColors(
      textPrimary: textPrimary ?? this.textPrimary,
      darkPrimary: darkPrimary ?? this.darkPrimary,
      background: background ?? this.background,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
    );
  }

  @override
  BDMSColors lerp(ThemeExtension<BDMSColors>? other, double t) {
    if (other is! BDMSColors) return this;
    return BDMSColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      darkPrimary: Color.lerp(darkPrimary, other.darkPrimary, t),
      background: Color.lerp(background, other.background, t),
      disabled: Color.lerp(disabled, other.disabled, t),
      success : Color.lerp(success, other.success, t),


    );
  }
}