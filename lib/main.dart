import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/kyc_checklist/presentation/widgets/identity_header.dart';

void main() {
  runApp(const KycApp());
}

class KycApp extends StatelessWidget {
  const KycApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KYC Flow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const _PlaceholderHome(), //temp - replace with real page
    );
  }
}

class _PlaceholderHome extends StatelessWidget {
  const _PlaceholderHome();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IdentityHeader(),
    );
  }
}
