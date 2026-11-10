import 'package:flutter/material.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/features/auth/presentation/pages/login_page.dart';
import 'package:kyc_platform/core/services/theme/app_radius.dart';
import 'package:kyc_platform/core/services/theme/app_sizes.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';

class ExploreAppWelcomePage extends StatelessWidget {
  const ExploreAppWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final scale = deviceWidth / AppSizes.headerDesignWidth;

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
                      top: AppSizes.exploreRingTopOffset * scale,
                      right: AppSizes.exploreRingRightOffsetPrimary * scale,
                      child: Container(
                        width: AppSizes.headerRingSize * scale,
                        height: AppSizes.headerRingSize * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.getColor(AppColor.accent),
                            width: AppSizes.headerRingWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppSizes.exploreRingTopOffset * scale,
                      right: AppSizes.exploreRingRightOffsetSecondary * scale,
                      child: Container(
                        width: AppSizes.headerRingSize * scale,
                        height: AppSizes.headerRingSize * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.getColor(AppColor.accent),
                            width: AppSizes.headerRingWidth,
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
                              height: AppSizes.exploreIllustrationHeight,
                              filterQuality: FilterQuality.high,
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              "Yay, you've joined My CBM!",
                              textAlign: TextAlign.center,
                              style: context
                                  .textStyle(AppTypographyRole.onboardingTitle),
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
                top: Radius.circular(AppRadius.s24),
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
                      borderRadius: BorderRadius.circular(AppRadius.s12),
                    ),
                    minimumSize:
                        const Size.fromHeight(AppSizes.primaryButtonHeight),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
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
