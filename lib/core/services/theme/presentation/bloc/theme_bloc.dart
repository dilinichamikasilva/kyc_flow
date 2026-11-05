import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc_platform/core/usecase/usecase.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/domain/usecases/get_theme_colors.dart';
import 'package:kyc_platform/core/services/theme/domain/usecases/get_theme_typorgraphy.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeColors getThemeColors;
  final GetThemeTypography getThemeTypography;

  ThemeBloc({
    required this.getThemeColors,
    required this.getThemeTypography,
  }) : super(const ThemeInitial()) {
    on<LoadTheme>(_onLoadTheme);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    emit(const ThemeLoading());

    final colorsResult = await getThemeColors(const NoParams());
    final typographyResult = await getThemeTypography(const NoParams());

    colorsResult.match(
      (failure) => emit(ThemeError(failure.message)),
      (colors) {
        typographyResult.match(
          (failure) => emit(ThemeError(failure.message)),
          (typography) =>
              emit(ThemeLoaded(colors: colors, typography: typography)),
        );
      },
    );
  }
}
