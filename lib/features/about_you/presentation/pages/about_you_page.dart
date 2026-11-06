import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/widgets/app_text_field.dart';
import 'package:kyc_platform/core/widgets/identity_header.dart';
import 'package:kyc_platform/core/utils/helper.dart';
import 'package:kyc_platform/features/about_you/presentation/bloc/about_you_form_bloc.dart';

class AboutYouPage extends StatelessWidget {
  const AboutYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutYouFormBloc(),
      child: const _AboutYouView(),
    );
  }
}

class _AboutYouView extends StatefulWidget {
  const _AboutYouView();

  @override
  State<_AboutYouView> createState() => _AboutYouViewState();
}

class _AboutYouViewState extends State<_AboutYouView> {
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
    if (pickedDate != null && mounted) {
      final formatted = Helper.formatDateDDMMYYYY(pickedDate);
      _dobController.text = formatted;
      context.read<AboutYouFormBloc>().add(DateOfBirthChanged(formatted));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AboutYouFormBloc, AboutYouFormState>(
      listener: (context, state) {
        if (state.submittedSuccessfully) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        final bloc = context.read<AboutYouFormBloc>();

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
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
                        errorText: state.nationalIdError,
                        onChanged: (value) =>
                            bloc.add(NationalIdChanged(value)),
                      ),
                      const SizedBox(height: AppSpacing.listGap),
                      AppTextField(
                        controller: _firstNameController,
                        hint: 'First name',
                        errorText: state.firstNameError,
                        onChanged: (value) => bloc.add(FirstNameChanged(value)),
                      ),
                      const SizedBox(height: AppSpacing.listGap),
                      AppTextField(
                        controller: _lastNameController,
                        hint: 'Last name',
                        errorText: state.lastNameError,
                        onChanged: (value) => bloc.add(LastNameChanged(value)),
                      ),
                      const SizedBox(height: AppSpacing.listGap * 2),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'optional',
                          style: context
                              .textStyle(AppTypographyRole.optionalLabel),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      AppTextField(
                        controller: _otherNamesController,
                        hint: 'Other names',
                        errorText: state.otherNamesError,
                        onChanged: (value) =>
                            bloc.add(OtherNamesChanged(value)),
                      ),
                      const SizedBox(height: AppSpacing.listGap),
                      AppTextField(
                        controller: _dobController,
                        hint: 'Date of birth (DD/MM/YYYY)',
                        readOnly: true,
                        errorText: state.dobError,
                        suffixIcon: GestureDetector(
                          onTap: _pickDateOfBirth,
                          child: Image.asset(
                            AppAssets.calendar,
                            width: AppSpacing.fieldSuffixIconSize,
                            height: AppSpacing.fieldSuffixIconSize,
                          ),
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
                      disabledBackgroundColor:
                          context.getColor(AppColor.cardBorder),
                      minimumSize: const Size.fromHeight(55),
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                    ),
                    onPressed: state.isValid
                        ? () => bloc.add(const FormSubmitted())
                        : null,
                    child: Text(
                      'Next',
                      style: context.textStyle(AppTypographyRole.buttonLabel),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
