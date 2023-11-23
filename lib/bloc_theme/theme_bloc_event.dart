part of 'theme_bloc_bloc.dart';

@immutable
sealed class ThemeBlocEvent {}

class ChangThemEvent extends ThemeBlocEvent {
  final String themeText;

  ChangThemEvent(this.themeText);
}
