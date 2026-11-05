import 'package:flutter/material.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';

class IdentityHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBack;

  static const double _designWidth = 430;
  static const double _ringSize = 500;
  static const double _ringWidth = 2;

  const IdentityHeader(
      {super.key, required this.title, required this.subtitle, this.onBack});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final scale = deviceWidth / _designWidth;

    return ClipRect(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.xl + 20,
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed:
                          onBack ?? () => Navigator.of(context).maybePop(),
                      icon: Image.asset(
                        'assets/icons/back_arrow.png',
                        width: AppSpacing.tileIconSize,
                        height: AppSpacing.tileIconSize,
                      ),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: AppSpacing.listGap),
                    Text(
                      title,
                      style:
                          context.textStyle(AppTypographyRole.onboardingTitle),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      subtitle,
                      style: context
                          .textStyle(AppTypographyRole.onboardingSubtitle),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
