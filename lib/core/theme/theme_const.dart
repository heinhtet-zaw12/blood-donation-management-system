import 'package:blood_donation_management_system/core/theme/extension/bdms_colors.dart';
import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:flutter/material.dart';

class ThemeConst {
  static ThemeData getTheme(){
    return ThemeData(
      // fontFamily: 'Roboto',
      colorScheme: ThemeData.light().colorScheme.copyWith(
       primary: Color(0xFFFF3443),
        secondary: Color(0xFFFFFFFF),
        error: Color(0xFFFF161A),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color:Color(0xFFFFFFFF),
            );
          }
          return const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF600007),
          );
        }),
      ),
      extensions: [BDMSColors(textPrimary: Color(0xFF000000), darkPrimary:Color(0xFF600007), background: Color(0xFFFEF0EF), disabled: Color(0xFFAAAAAA), success: Color(0xFF00BD13)),
      BDMSTextTheme(
        title: TextStyle(fontFamily: 'Roboto',fontSize:  56 , fontWeight:  FontWeight.w700), 
        subTitle: TextStyle(fontFamily: 'Roboto',fontSize: 24, fontWeight: FontWeight.w600),
        bodyRegular: TextStyle(fontFamily: 'Roboto',fontSize: 17, fontWeight:  FontWeight.w400),
        tabText: TextStyle(fontFamily: 'Roboto',fontSize:  14, fontWeight: FontWeight.w600,))
      ],

    );
  }
}