import 'package:dartz/dartz.dart';

import '../../../../core/networking/error/failure.dart';
import '../entities/todo.dart';

abstract class TodoRemoteRepository {
  Future<Either<Failure, Todo>> add(Todo todo);

  Future<Either<Failure, Todo>> edit(Todo todo);

  Future<Either<Failure, Todo>> delete(Todo todo);

  Future<Either<Failure, List<Todo>>> getAll();
}
