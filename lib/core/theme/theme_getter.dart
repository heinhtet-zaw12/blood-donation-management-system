import 'package:flutter/material.dart';

import 'extension/bdms_colors.dart';
import 'extension/bdms_text_theme.dart';

extension ThemeGetter on BuildContext {

  BDMSColors get colors => Theme.of(this).extension<BDMSColors>()!;


  BDMSTextTheme get bdmsText => Theme.of(this).extension<BDMSTextTheme>()!;
}