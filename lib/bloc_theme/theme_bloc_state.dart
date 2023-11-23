part of 'theme_bloc_bloc.dart';

@immutable
sealed class ThemeBlocState {}

final class GetThemeState extends ThemeBlocState {
  final ThemeData themeData;

  GetThemeState(this.themeData);
}
