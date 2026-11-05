part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
}

class ThemeLoading extends ThemeState {
  const ThemeLoading();
}

class ThemeLoaded extends ThemeState {
  final Map<AppColor, Color> colors;
  final Map<AppTypographyRole, TextStyle> typography;

  const ThemeLoaded({
    required this.colors,
    required this.typography,
  });

  @override
  List<Object> get props => [colors, typography];
}

class ThemeError extends ThemeState {
  final String message;

  const ThemeError(this.message);

  @override
  List<Object> get props => [message];
}
