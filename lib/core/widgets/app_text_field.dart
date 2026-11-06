import 'package:flutter/material.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.keyboardType,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.getColor(AppColor.surfaceWhite),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasError
                  ? context.getColor(AppColor.error)
                  : context.getColor(AppColor.cardBorder),
              width: hasError ? 1.5 : 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: readOnly,
                  onTap: onTap,
                  onChanged: onChanged,
                  keyboardType: keyboardType,
                  style: context.textStyle(AppTypographyRole.inputHint),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: context.textStyle(AppTypographyRole.inputHint),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (suffixIcon != null) ...[
                const SizedBox(width: AppSpacing.sm),
                suffixIcon!,
              ],
            ],
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            errorText!,
            style: context.textStyle(AppTypographyRole.errorLabel),
          ),
        ],
      ],
    );
  }
}
