import 'package:flutter/material.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';

class KycSection extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final String? statusLabel;
  final bool isActive;

  const KycSection({
    super.key,
    this.isActive = true,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.statusLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          constraints: const BoxConstraints(minHeight: AppSpacing.tileHeight),
          decoration: BoxDecoration(
            color: isActive
                ? context.getColor(AppColor.backgroundLight)
                : context.getColor(AppColor.cardBackgroundInactive),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.getColor(AppColor.cardBorder),
              width: 1,
            ),
          ),
          child: Padding(
            // top 16 / right 12 / bottom 16 / left 12
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (statusLabel != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      statusLabel!,
                      style: context.textStyle(AppTypographyRole.tileSubtitle),
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor:
                          context.getColor(AppColor.avatarBackground),
                      child: icon,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style:
                                context.textStyle(AppTypographyRole.tileTitle),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            description,
                            style: context
                                .textStyle(AppTypographyRole.tileSubtitle),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Icon(
                      Icons.chevron_right,
                      color: context.getColor(AppColor.textMuted),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
