import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int? statusCode;
  final String message;
  const Failure({this.statusCode, required this.message});

  @override
  List<Object?> get props => [
        statusCode,
        message,
      ];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class DataLocalFailure extends Failure {
  const DataLocalFailure({required super.message});
}
