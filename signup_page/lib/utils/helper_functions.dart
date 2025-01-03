import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


void changeLang(BuildContext context) {
  Locale currentLocale = EasyLocalization.of(context)!.locale;
  if (currentLocale == Locale('en','US')) {
    EasyLocalization.of(context)!.setLocale(Locale('ar','EG'));
  } else {
    EasyLocalization.of(context)!.setLocale(Locale('en','US'));
  }
}
