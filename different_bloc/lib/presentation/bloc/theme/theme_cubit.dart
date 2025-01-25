import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());

  void toggleTheme() {
    emit(state == ThemeData.light()? ThemeData.dark() : ThemeData.light());
  }
}