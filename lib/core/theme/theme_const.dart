import 'package:blood_donation_management_system/core/theme/extension/bdms_colors.dart';
import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:flutter/material.dart';

class ThemeConst {
  static ThemeData getTheme(){
    return ThemeData(
      colorScheme: ThemeData.light().colorScheme.copyWith(
       primary: Color(0xFFFF3443),
        secondary: Color(0xFFFFFFFF),
        error: Color(0xFFFF161A),
      ),
      extensions: [BDMSColors(textPrimary: Color(0xFF000000), darkPrimary:Color(0xFF600007), background: Color(0xFFFEF0EF), disabled: Color(0xFFAAAAAA), success: Color(0xFF00E53A)),
      BDMSTextTheme(title: TextStyle(fontSize:  56 , fontWeight:  FontWeight.w700), subTitle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500), bodyRegular: TextStyle(fontSize: 17, fontWeight:  FontWeight.w600), tabText: TextStyle(fontSize:  14,
        fontWeight: FontWeight.w600,))
      ]
    );
  }
}