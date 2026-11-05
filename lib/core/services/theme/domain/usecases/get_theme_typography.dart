import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kyc_platform/core/errors/failure.dart';
import 'package:kyc_platform/core/usecase/usecase.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_typography.dart';
import 'package:kyc_platform/core/services/theme/domain/repositories/theme_repository.dart';

class GetThemeTypography
    implements UseCase<Map<AppTypographyRole, TextStyle>, NoParams> {
  final ThemeRepository repository;

  GetThemeTypography(this.repository);

  @override
  Future<Either<Failure, Map<AppTypographyRole, TextStyle>>> call(
      NoParams params) async {
    return repository.getTypography();
  }
}
