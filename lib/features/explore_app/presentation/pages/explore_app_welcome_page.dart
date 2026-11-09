import 'package:flutter/material.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';

class ExploreAppWelcomePage extends StatelessWidget {
  const ExploreAppWelcomePage({super.key});

  static const double _designWidth = 430;
  static const double _ringSize = 500;
  static const double _ringWidth = 2;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final scale = deviceWidth / _designWidth;

    return Scaffold(
      backgroundColor: context.getColor(AppColor.backgroundLight),
      body: Column(
        children: [
          Expanded(
            child: ClipRect(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.getColor(AppColor.primaryDark),
                      context.getColor(AppColor.primaryLight),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -80 * scale,
                      right: 100 * scale,
                      child: Container(
                        width: _ringSize * scale,
                        height: _ringSize * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.getColor(AppColor.accent),
                            width: _ringWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40 * scale,
                      right: -340 * scale,
                      child: Container(
                        width: _ringSize * scale,
                        height: _ringSize * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.getColor(AppColor.accent),
                            width: _ringWidth,
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.exploreAppIllustration,
                              height: 90,
                              filterQuality: FilterQuality.high,
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              "Yay, you've joined My CBM!",
                              textAlign: TextAlign.center,
                              style: context.textStyle(
                                  AppTypographyRole.onboardingTitle),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              'You can explore My CBM with limited features '
                              'while we review your information. Full access '
                              'will be granted upon verification.',
                              textAlign: TextAlign.center,
                              style: context.textStyle(
                                  AppTypographyRole.onboardingSubtitle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.getColor(AppColor.backgroundLight),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.getColor(AppColor.buttonPrimary),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size.fromHeight(55),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Let's Go",
                    style: context.textStyle(AppTypographyRole.buttonLabel),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
