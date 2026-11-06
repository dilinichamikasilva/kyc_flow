import 'package:flutter/material.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/features/kyc_checklist/presentation/widgets/kyc_section.dart';
import 'package:kyc_platform/features/about_you/presentation/pages/about_you_page.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';

class KycChecklistPage extends StatefulWidget {
  const KycChecklistPage({super.key});

  @override
  State<KycChecklistPage> createState() => _KycChecklistPageState();
}

class _KycChecklistPageState extends State<KycChecklistPage> {
  bool _aboutYouCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.getColor(AppColor.backgroundLight),
      body: Column(
        children: [
          const IdentityHeader(
            title: "Let's clarify your\nidentity",
            subtitle: "We'll keep your information secure and confidential.",
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                KycSection(
                  icon: Image.asset(
                    AppAssets.aboutYou,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                  ),
                  title: 'About you',
                  description: 'Your citizenship and personal details.',
                  statusLabel: _aboutYouCompleted ? 'completed' : null,
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutYouPage(),
                      ),
                    );
                    if (result == true) {
                      setState(() => _aboutYouCompleted = true);
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.listGap),
                KycSection(
                  icon: Image.asset(
                    AppAssets.yourIdentity,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                  ),
                  title: 'Your Identity',
                  description: 'Checking to make sure you and your ID match.',
                  isActive: _aboutYouCompleted,
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.listGap),
                KycSection(
                  icon: Image.asset(
                    AppAssets.otherDocument,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                  ),
                  title: 'Other document',
                  description:
                      'Processing of transactions and services that require your authorization.',
                  isActive: _aboutYouCompleted,
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.listGap),
                KycSection(
                  icon: Image.asset(
                    AppAssets.billingProof,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                  ),
                  title: 'Billing proof',
                  description:
                      'Checking to make sure you are an authorized representative.',
                  isActive: _aboutYouCompleted,
                  onTap: () {},
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
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg + AppSpacing.belowButtonGap,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.getColor(AppColor.buttonPrimary),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(55),
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              ),
              onPressed: () {},
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
