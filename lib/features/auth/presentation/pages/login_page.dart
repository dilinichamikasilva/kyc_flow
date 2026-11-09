import 'package:flutter/material.dart';
import 'package:kyc_platform/core/constants/app_assets.dart';
import 'package:kyc_platform/core/services/theme/app_spacing.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/presentation/extension/theme_context_extension.dart';
import 'package:kyc_platform/core/widgets/app_text_field.dart';
import 'package:kyc_platform/features/kyc_checklist/presentation/pages/kyc_checklist_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  static const double _headerHeight = 300;
  static const double _headerOverlap = 40;
  static const double _designWidth = 430;
  static const double _ringSize = 500;
  static const double _ringWidth = 2;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _goHome() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const KycChecklistPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final scale = deviceWidth / _designWidth;

    return Scaffold(
      backgroundColor: context.getColor(AppColor.backgroundLight),
      body: SizedBox.expand(
        child: Stack(
          children: [
            ClipRect(
              child: Container(
                height: _headerHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.getColor(AppColor.primaryDark),
                      context.getColor(AppColor.primaryLight),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -80 * scale,
                      right: 100 * scale,
                      child: Container(
                        width: _ringSize * scale,
                        height: _ringSize * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.getColor(AppColor.accent),
                            width: _ringWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40 * scale,
                      right: -340 * scale,
                      child: Container(
                        width: _ringSize * scale,
                        height: _ringSize * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.getColor(AppColor.accent),
                            width: _ringWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.lg,
                        AppSpacing.lg,
                        AppSpacing.lg,
                        0,
                      ),
                      child: SafeArea(
                        bottom: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.md,
                                  vertical: AppSpacing.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'English',
                                      style: context
                                          .textStyle(
                                              AppTypographyRole.optionalLabel)
                                          .copyWith(
                                            color: context
                                                .getColor(AppColor.textPrimary),
                                          ),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              'Login',
                              style: context
                                  .textStyle(AppTypographyRole.onboardingTitle),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              'Unlock more with your password.',
                              style: context.textStyle(
                                  AppTypographyRole.onboardingSubtitle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _headerHeight - _headerOverlap,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: context.getColor(AppColor.backgroundLight),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md,
                      AppSpacing.xl,
                      AppSpacing.md,
                      AppSpacing.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextField(
                          controller: _usernameController,
                          hint: 'Username',
                        ),
                        const SizedBox(height: AppSpacing.listGap),
                        AppTextField(
                          controller: _passwordController,
                          hint: 'Password',
                          obscureText: _obscurePassword,
                          suffixIcon: GestureDetector(
                            onTap: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                            child: Image.asset(
                              AppAssets.eyeOff,
                              width: AppSpacing.fieldSuffixIconSize,
                              height: AppSpacing.fieldSuffixIconSize,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot password?',
                            style: context
                                .textStyle(AppTypographyRole.optionalLabel),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xl,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      context.getColor(AppColor.buttonPrimary),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  minimumSize: const Size.fromHeight(55),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Login',
                                  style: context
                                      .textStyle(AppTypographyRole.buttonLabel),
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      context.getColor(AppColor.buttonPrimary),
                                  side: BorderSide(
                                    color: context
                                        .getColor(AppColor.buttonPrimary),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  minimumSize: const Size.fromHeight(55),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Register',
                                  style: context
                                      .textStyle(AppTypographyRole.buttonLabel)
                                      .copyWith(
                                        color: context
                                            .getColor(AppColor.buttonPrimary),
                                      ),
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      context.getColor(AppColor.textPrimary),
                                  side: BorderSide(
                                    color:
                                        context.getColor(AppColor.cardBorder),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  minimumSize: const Size.fromHeight(55),
                                ),
                                onPressed: _goHome,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.googleLogo,
                                      width: 20,
                                      height: 20,
                                      filterQuality: FilterQuality.high,
                                    ),
                                    const SizedBox(width: AppSpacing.sm),
                                    Text(
                                      'Sign in with Google',
                                      style: context
                                          .textStyle(
                                              AppTypographyRole.buttonLabel)
                                          .copyWith(
                                            color: context
                                                .getColor(AppColor.textPrimary),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Divider(color: context.getColor(AppColor.cardBorder)),
                        const SizedBox(height: AppSpacing.md),
                        Center(
                          child: Text(
                            'Kill Account',
                            style: context
                                .textStyle(AppTypographyRole.tileSubtitle)
                                .copyWith(
                                  color: context.getColor(AppColor.textMuted),
                                ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xl,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Need help?',
                                style: context
                                    .textStyle(AppTypographyRole.tileSubtitle)
                                    .copyWith(
                                      color: context
                                          .getColor(AppColor.buttonPrimary),
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                'More info',
                                style: context
                                    .textStyle(AppTypographyRole.tileSubtitle)
                                    .copyWith(
                                      color: context
                                          .getColor(AppColor.textPrimary),
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          'By using My CBM, you agree to our Terms of use and '
                          'Privacy Policy',
                          textAlign: TextAlign.center,
                          style: context
                              .textStyle(AppTypographyRole.tileSubtitle)
                              .copyWith(
                                color: context.getColor(AppColor.textMuted),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
