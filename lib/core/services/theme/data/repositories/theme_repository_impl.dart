import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kyc_platform/core/errors/failure.dart';
import 'package:kyc_platform/core/services/theme/data/datasources/theme_local_datasource.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/domain/repositories/theme_repository.dart';  

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl(this.localDataSource);

  @override
  Either<Failure, Map<AppColor, Color>> getColors() {
    try {
      final colors = localDataSource.getColors();
      return Right(colors);
    } catch (e) {
      return Left(AppFailure(title: 'Theme Error', message: 'Failed to load theme colors'));
    }
  }

  @override
  Either<Failure, Map<AppTypographyRole, TextStyle>> getTypography() {
    try {
      final typography = localDataSource.getTypography();
      return Right(typography);
    } catch (e) {
      return Left(AppFailure(title: 'Theme Error', message: 'Failed to load theme typography'));
    }
  }
}
