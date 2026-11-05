import 'package:flutter/material.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';

class ThemeLocalDataSource {
  Map<AppColor, Color> getColors() {
    return {
      AppColor.primaryDark: const Color(0xFF471165),
      AppColor.primaryLight: const Color(0xFF363C93),
      AppColor.accent: const Color(0xFF4CDA8B),
      AppColor.backgroundLight: const Color(0xFFF5F6FA),
      AppColor.cardBackground: const Color(0xFFEFF1F7),
      AppColor.textPrimary: const Color(0xFF1A1A2E),
      AppColor.textMuted: const Color(0xFF8A8CA5),
      AppColor.surfaceWhite: const Color(0xFFFFFFFF),
    };
  }

  Map<AppTypographyRole, TextStyle> getTypography() {
    return {
      AppTypographyRole.onboardingTitle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.2,
      ),
      AppTypographyRole.onboardingSubtitle: const TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
      AppTypographyRole.tileTitle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      AppTypographyRole.tileSubtitle: const TextStyle(
        fontSize: 13,
      ),
      AppTypographyRole.buttonLabel: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    };
  }
}
