import 'package:flutter/material.dart';
import 'package:kyc_platform/core/services/theme/app_colors.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/app_text_styles.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';
import 'package:kyc_platform/features/about_you/presentation/widgets/app_text_field.dart';

class AboutYouPage extends StatefulWidget {
  const AboutYouPage({super.key});

  @override
  State<AboutYouPage> createState() => _AboutYouPageState();
}

class _AboutYouPageState extends State<AboutYouPage> {
  final _nationalIdController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _nationalIdController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _otherNamesController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _pickDateOfBirth() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      final day = pickedDate.day.toString().padLeft(2, '0');
      final month = pickedDate.month.toString().padLeft(2, '0');
      _dobController.text = '$day/$month/${pickedDate.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const IdentityHeader(
            title: 'Tell us a little about\nyou',
            subtitle:
                'Enter your first, last, and other names exactly as they appear in your national ID.',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                AppTextField(
                  controller: _nationalIdController,
                  hint: 'National ID Number',
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextField(
                  controller: _firstNameController,
                  hint: 'First name',
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextField(
                  controller: _lastNameController,
                  hint: 'Last name',
                ),
                const SizedBox(height: AppSpacing.xs),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('optional', style: AppTextStyles.tileDescription),
                ),
                const SizedBox(height: AppSpacing.xs),
                AppTextField(
                  controller: _otherNamesController,
                  hint: 'Other names',
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextField(
                  controller: _dobController,
                  hint: 'Date of birth (DD/MM/YYYY)',
                  readOnly: true,
                  onTap: _pickDateOfBirth,
                  suffixIcon: const Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.textMuted,
                  ),
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
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Next'),
          ),
        ),
      ),
    );
  }
}
