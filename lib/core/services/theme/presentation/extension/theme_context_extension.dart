import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/bloc/theme_bloc.dart';

extension ThemeContextExtension on BuildContext {
  Color getColor(AppColor color) {
    final state = watch<ThemeBloc>().state;
    if (state is ThemeLoaded) {
      return state.colors[color] ?? Colors.transparent;
    }
    return Colors.transparent;
  }

  TextStyle textStyle(AppTypographyRole role) {
    final state = watch<ThemeBloc>().state;
    if (state is ThemeLoaded) {
      return state.typography[role] ?? const TextStyle();
    }
    return const TextStyle();
  }
}
