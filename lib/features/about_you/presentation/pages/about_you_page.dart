import 'package:flutter/material.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/utils/validators.dart';
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

  String? _nationalIdError;
  String? _firstNameError;
  String? _lastNameError;
  String? _otherNamesError;
  String? _dobError;

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
      setState(() => _dobError = Validators.dateOfBirth18Plus(_dobController.text));
    }
  }

  bool _validate() {
    setState(() {
      _nationalIdError = Validators.nationalId(_nationalIdController.text);
      _firstNameError =
          Validators.name(_firstNameController.text, fieldName: 'First name');
      _lastNameError =
          Validators.name(_lastNameController.text, fieldName: 'Last name');
      _otherNamesError = Validators.optionalName(
        _otherNamesController.text,
        fieldName: 'Other names',
      );
      _dobError = Validators.dateOfBirth18Plus(_dobController.text);
    });

    return _nationalIdError == null &&
        _firstNameError == null &&
        _lastNameError == null &&
        _otherNamesError == null &&
        _dobError == null;
  }

  void _onNextPressed() {
    if (_validate()) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.getColor(AppColor.backgroundLight),
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
                  errorText: _nationalIdError,
                  onChanged: (_) {
                    if (_nationalIdError != null) {
                      setState(() => _nationalIdError =
                          Validators.nationalId(_nationalIdController.text));
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.listGap),
                AppTextField(
                  controller: _firstNameController,
                  hint: 'First name',
                  errorText: _firstNameError,
                  onChanged: (_) {
                    if (_firstNameError != null) {
                      setState(() => _firstNameError = Validators.name(
                          _firstNameController.text,
                          fieldName: 'First name'));
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.listGap),
                AppTextField(
                  controller: _lastNameController,
                  hint: 'Last name',
                  errorText: _lastNameError,
                  onChanged: (_) {
                    if (_lastNameError != null) {
                      setState(() => _lastNameError = Validators.name(
                          _lastNameController.text,
                          fieldName: 'Last name'));
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.listGap * 2),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'optional',
                    style: context.textStyle(AppTypographyRole.optionalLabel),
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                AppTextField(
                  controller: _otherNamesController,
                  hint: 'Other names',
                  errorText: _otherNamesError,
                  onChanged: (_) {
                    if (_otherNamesError != null) {
                      setState(() => _otherNamesError = Validators.optionalName(
                          _otherNamesController.text,
                          fieldName: 'Other names'));
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.listGap),
                AppTextField(
                  controller: _dobController,
                  hint: 'Date of birth (DD/MM/YYYY)',
                  readOnly: true,
                  onTap: _pickDateOfBirth,
                  errorText: _dobError,
                  suffixIcon: Image.asset(
                    'assets/icons/calendar.png',
                    width: AppSpacing.fieldSuffixIconSize,
                    height: AppSpacing.fieldSuffixIconSize,
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
              onPressed: _onNextPressed,
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
