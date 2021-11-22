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
