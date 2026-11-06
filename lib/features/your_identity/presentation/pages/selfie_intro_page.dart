import 'package:flutter/material.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';
import 'package:kyc_platform/features/your_identity/presentation/pages/national_id_intro_page.dart';

class SelfieIntroPage extends StatelessWidget {
  const SelfieIntroPage({super.key});

  static const _checklistItems = [
    'Make sure you are in a well-lit room',
    'Make sure we can see you clearly',
    'Remove anything that hides your face (glasses are fine)',
    'Look straight at the camera and smile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.getColor(AppColor.backgroundLight),
      body: Column(
        children: [
          const IdentityHeader(
            title: "Let's take a selfie",
            subtitle: "Your selfie will let us know it's really you.",
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
                    AppAssets.selfieIllustration,
                    height: 190,
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
                          width: 22,
                          height: 22,
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
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(55),
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              ),
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NationalIdIntroPage(),
                  ),
                );
                if (result == true && context.mounted) {
                  Navigator.of(context).pop(true);
                }
              },
              child: Text(
                "I'm ready",
                style: context.textStyle(AppTypographyRole.buttonLabel),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
