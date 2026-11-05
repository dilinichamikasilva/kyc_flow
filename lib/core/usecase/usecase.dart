import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kyc_platform/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}


// this is base usecase class