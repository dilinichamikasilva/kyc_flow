import 'package:flutter/material.dart';
import 'package:kyc_platform/core/errors/failure.dart';
import 'package:kyc_platform/core/usecase/usecase.dart';
import 'package:kyc_platform/core/services/theme/domain/entities/app_color.dart';
import 'package:kyc_platform/core/services/theme/domain/repositories/theme_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetThemeColors implements UseCase<Map<AppColor, Color>, NoParams> {
  final ThemeRepository repository;

  GetThemeColors(this.repository);

  @override
  Future<Either<Failure, Map<AppColor, Color>>> call(NoParams params) async {
    return repository.getColors();
  }
}
