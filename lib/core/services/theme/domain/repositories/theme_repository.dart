import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kyc_platform/core/errors/failure.dart';
import '../entities/app_color.dart';
import '../entities/app_typography.dart';

abstract class ThemeRepository {
  Either<Failure, Map<AppColor, Color>> getColors();
  Either<Failure, Map<AppTypographyRole, TextStyle>> getTypography();
}
