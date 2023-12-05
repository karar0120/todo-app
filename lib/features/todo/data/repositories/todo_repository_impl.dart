import 'package:dartz/dartz.dart';
import '../../../../core/networking/error/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../database/todo_local_database.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatabase remoteDatabase;

  TodoRepositoryImpl({
    required this.remoteDatabase,
  });

  @override
  Future<Either<Failure, Todo>> add(Todo todo) async {
    try {
      final results = await remoteDatabase.addTodo(todo);
      return Right(results);
    } on DataLocalFailure catch (failure) {
      return Left(Failure(
        message: failure.message,
      ));
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async {
    try {
      final results = await remoteDatabase.deleteTodo(todo);
      return Right(results);
    } on DataLocalFailure catch (failure) {
      return Left(Failure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async {
    try {
      final results = await remoteDatabase.editTodo(todo);
      return Right(results);
    } on DataLocalFailure catch (failure) {
      return Left(Failure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll() async {
    try {
      final results = await remoteDatabase.listTodos();
      return Right(results);
    } on DataLocalFailure catch (failure) {
      return Left(Failure(message: failure.message));
    }
  }
}
