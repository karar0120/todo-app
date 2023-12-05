import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../networking/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameter);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}

class Params<T> extends Equatable {
  final T data;

  const Params(this.data);

  @override
  List<Object?> get props => [
        data,
      ];
}
