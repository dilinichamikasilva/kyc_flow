import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String message;
  final int? statusCode;

  const Failure({
    required this.title,
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [title, message, statusCode];
}

class AppFailure extends Failure {
  const AppFailure({
    required super.title,
    required super.message,
  });
}

class APIFailure extends Failure {
  const APIFailure({
    required super.title,
    required super.message,
    super.statusCode,
  });
}
