import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/features/kyc_checklist/presentation/bloc/kyc_checklist_bloc.dart';
import 'package:kyc_platform/features/kyc_checklist/presentation/widgets/kyc_section.dart';
import 'package:kyc_platform/features/about_you/presentation/pages/about_you_page.dart';
import 'package:kyc_platform/features/your_identity/presentation/pages/selfie_intro_page.dart';
import 'package:kyc_platform/features/your_identity/presentation/pages/work_permit_intro_page.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';

class KycChecklistPage extends StatelessWidget {
  const KycChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KycChecklistBloc(),
      child: const _KycChecklistView(),
    );
  }
}

class _KycChecklistView extends StatelessWidget {
  const _KycChecklistView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<KycChecklistBloc>();
    final state = context.watch<KycChecklistBloc>().state;

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
                    filterQuality: FilterQuality.high,
                  ),
                  title: 'About you',
                  description: 'Your citizenship and personal details.',
                  statusLabel: state.aboutYouCompleted ? 'completed' : null,
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutYouPage(),
                      ),
                    );
                    if (result == true) {
                      bloc.add(const AboutYouCompleted());
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.listGap),
                KycSection(
                  icon: Image.asset(
                    state.aboutYouCompleted
                        ? AppAssets.yourIdentity
                        : AppAssets.yourIdentityInactive,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                    filterQuality: FilterQuality.high,
                  ),
                  title: 'Your Identity',
                  description: 'Checking to make sure you and your ID match.',
                  statusLabel:
                      state.yourIdentityCompleted ? 'completed' : null,
                  isActive: state.aboutYouCompleted,
                  onTap: state.aboutYouCompleted
                      ? () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SelfieIntroPage(),
                            ),
                          );
                          if (result == true) {
                            bloc.add(const YourIdentityCompleted());
                          }
                        }
                      : null,
                ),
                const SizedBox(height: AppSpacing.listGap),
                KycSection(
                  icon: Image.asset(
                    state.yourIdentityCompleted
                        ? AppAssets.otherDocument
                        : AppAssets.otherDocumentInactive,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                    filterQuality: FilterQuality.high,
                  ),
                  title: 'Other document',
                  description:
                      'Processing of transactions and services that require your authorization.',
                  statusLabel:
                      state.otherDocumentCompleted ? 'completed' : null,
                  isActive: state.yourIdentityCompleted,
                  onTap: state.yourIdentityCompleted
                      ? () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const WorkPermitIntroPage(),
                            ),
                          );
                          if (result == true) {
                            bloc.add(const OtherDocumentCompleted());
                          }
                        }
                      : null,
                ),
                const SizedBox(height: AppSpacing.listGap),
                KycSection(
                  icon: Image.asset(
                    state.otherDocumentCompleted
                        ? AppAssets.billingProof
                        : AppAssets.billingProofInactive,
                    width: AppSpacing.tileIconSize,
                    height: AppSpacing.tileIconSize,
                    filterQuality: FilterQuality.high,
                  ),
                  title: 'Billing proof',
                  description:
                      'Checking to make sure you are an authorized representative.',
                  isActive: state.otherDocumentCompleted,
                  onTap: state.otherDocumentCompleted ? () {} : null,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(55),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
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
