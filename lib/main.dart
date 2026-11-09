import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/theme/data/datasources/theme_local_datasource.dart';
import 'core/services/theme/data/repositories/theme_repository_impl.dart';
import 'core/services/theme/domain/usecases/get_theme_colors.dart';
import 'core/services/theme/domain/usecases/get_theme_typography.dart';
import 'core/services/theme/presentation/bloc/theme_bloc.dart';
import 'features/explore_app/presentation/pages/explore_app_welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KycApp());
}

class KycApp extends StatelessWidget {
  const KycApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeRepository = ThemeRepositoryImpl(ThemeLocalDataSource());

    return BlocProvider(
      create: (_) => ThemeBloc(
        getThemeColors: GetThemeColors(themeRepository),
        getThemeTypography: GetThemeTypography(themeRepository),
      )..add(const LoadTheme()),
      child: const MaterialApp(
        title: 'KYC Flow',
        debugShowCheckedModeBanner: false,
        home: ExploreAppWelcomePage(),
      ),
    );
  }
}
