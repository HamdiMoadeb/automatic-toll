import 'package:equatable/equatable.dart';
import 'package:tollxpress/core/errors/exceptions.dart';

class Failure extends Equatable {
  final String message;
  final dynamic statusCode;

  Failure({
    required this.message,
    required this.statusCode,
  }) : assert(statusCode is String || statusCode is int,
            'status code cannot be ${statusCode.runtimeType}');

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, required super.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}
