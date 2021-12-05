import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? statusCode;
  final String message;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class APIFailure extends Failure {
  const APIFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure({required String message}) : super(message: message);
}