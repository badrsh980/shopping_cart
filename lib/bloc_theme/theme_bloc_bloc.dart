import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/theme/app_theme.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBlocBloc extends Bloc<ThemeBlocEvent, ThemeBlocState> {
  final SharedPreferences sharedPreferences;

  ThemeBlocBloc({required this.sharedPreferences})
      : super(GetThemeState(appThemeMap[sharedPreferences.getString('theme')] ??
            appThemeMap["dark"])) {
    on<ChangThemEvent>(_onChangThemEvent);
  }

  void _onChangThemEvent(ChangThemEvent event, Emitter<ThemeBlocState> emit) {
    sharedPreferences.setString('theme', event.themeText);
    emit(GetThemeState(appThemeMap[event.themeText]));
  }
}
