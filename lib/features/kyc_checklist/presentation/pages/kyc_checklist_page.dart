import 'package:flutter/material.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';
import 'package:kyc_platform/core/theme/app_spacing.dart';
import 'package:kyc_platform/features/kyc_checklist/presentation/widgets/kyc_section.dart';
import 'package:kyc_platform/features/about_you/presentation/pages/about_you_page.dart';

class KycChecklistPage extends StatelessWidget {
  const KycChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: Icons.person_outline,
                  title: 'About you',
                  description: 'Your citizenship and personal details.',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutYouPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                KycSection(
                  icon: Icons.badge_outlined,
                  title: 'Your Identity',
                  description: 'Checking to make sure you and your ID match.',
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.sm),
                KycSection(
                  icon: Icons.description_outlined,
                  title: 'Other document',
                  description:
                      'Processing of transactions and services that require your authorization.',
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.sm),
                KycSection(
                  icon: Icons.receipt_long_outlined,
                  title: 'Billing proof',
                  description:
                      'Checking to make sure you are an authorized representative.',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Next'),
              ))),
    );
  }
}
