import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:flutter/material.dart';

Widget EllipsisLabel(String label , Color color ,BDMSTextTheme textTheme,  {Alignment alignment=Alignment.centerLeft}) {
  return Align(
    alignment:  alignment,
    
    child: Text(label,textAlign: TextAlign.center, 
    maxLines: 1,overflow: TextOverflow.ellipsis,
    style: textTheme.tabText.copyWith(
      color: color
    )),
  );
}