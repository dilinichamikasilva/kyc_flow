import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';

class ThemeLocalDataSource {
  Map<AppColor, Color> getColors() {
    return {
      AppColor.primaryDark: const Color(0xFF471165),
      AppColor.primaryLight: const Color(0xFF363C93),
      AppColor.accent: const Color(0xFF2E9E66),
      AppColor.backgroundLight: const Color(0xFFF7F8FC),
      AppColor.cardBackgroundInactive: const Color(0xFFF1F5F9),
      AppColor.textPrimary: const Color(0xFF1A1A2E),
      AppColor.textMuted: const Color(0xFF8A8CA5),
      AppColor.textSecondary: const Color(0xFF475569),
      AppColor.surfaceWhite: const Color(0xFFFFFFFF),
      AppColor.buttonPrimary: const Color(0xFF453089),
      AppColor.cardBorder: const Color(0xFFCBD5E1),
      AppColor.avatarBackground: const Color(0xFFE5E7EB),
      AppColor.buttonContainerBackground: const Color(0xFFF8FAFC),
      AppColor.error: const Color(0xFFDC2626),
    };
  }

  Map<AppTypographyRole, TextStyle> getTypography() {
    return {
      AppTypographyRole.onboardingTitle: GoogleFonts.plusJakartaSans(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1.0,
        letterSpacing: -0.36,
      ),
      AppTypographyRole.onboardingSubtitle: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.0,
        letterSpacing: 0.16,
      ),
      AppTypographyRole.tileTitle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      AppTypographyRole.tileSubtitle: const TextStyle(
        fontSize: 14,
      ),
      AppTypographyRole.buttonLabel: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 1.0,
        letterSpacing: 0.18,
      ),
      AppTypographyRole.inputHint: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF475569),
        height: 1.0,
        letterSpacing: 0.16,
      ),
      AppTypographyRole.optionalLabel: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF475569),
        height: 1.0,
        letterSpacing: 0.14,
      ),
      AppTypographyRole.errorLabel: GoogleFonts.plusJakartaSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFDC2626),
      ),
    };
  }
}
