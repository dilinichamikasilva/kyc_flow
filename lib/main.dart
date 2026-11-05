import 'package:flutter/material.dart';
import 'core/services/theme/app_theme.dart';
import 'features/kyc_checklist/presentation/pages/kyc_checklist_page.dart';

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
      home: const KycChecklistPage(),
    );
  }
}
