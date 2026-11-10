import 'package:flutter/material.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/services/theme/app_radius.dart';
import 'package:kyc_platform/core/services/theme/app_sizes.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';

class WorkPermitIntroPage extends StatelessWidget {
  const WorkPermitIntroPage({super.key});

  static const _checklistItems = [
    'Make sure you are in a well-lit room',
    'Put your signature on a plain dark surface',
    "Check there's no glare on your signature",
    'Check we can see your signature clearly',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.getColor(AppColor.backgroundLight),
      body: Column(
        children: [
          const IdentityHeader(
            title: "Let's Take a Photo of\nYour Work permit",
            subtitle:
                'We can only accept a photo of your work permit. That means, no scans or photocopies.',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                AppSpacing.xl,
                AppSpacing.xl,
                AppSpacing.md,
              ),
              children: [
                Center(
                  child: Image.asset(
                    AppAssets.workPermitIllustration,
                    height: 210,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                for (final item in _checklistItems)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets.checklistTick,
                          width: AppSizes.checklistTickSize,
                          height: AppSizes.checklistTickSize,
                          filterQuality: FilterQuality.high,
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            item,
                            style:
                                context.textStyle(AppTypographyRole.tileSubtitle),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: context.getColor(AppColor.buttonContainerBackground),
        child: SafeArea(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Next',
                style: context.textStyle(AppTypographyRole.buttonLabel),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
