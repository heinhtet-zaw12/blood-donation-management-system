import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:flutter/material.dart';

Widget buildLabel(String label , Color color ,BDMSTextTheme textTheme ) {
  return Align(
    alignment:  Alignment.centerLeft,
    child: Text(label, style: textTheme.tabText.copyWith(
      color: color
    )),
  );

}