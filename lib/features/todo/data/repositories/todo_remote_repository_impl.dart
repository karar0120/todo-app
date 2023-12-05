import 'package:dartz/dartz.dart';
import 'package:todo_app/core/networking/error/failure.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_remote_repository.dart';

import '../../../../core/networking/app_service_client/error_handler.dart';
import '../../../../core/networking/app_service_client/network_info.dart';
import '../database/todo_remote_database.dart';

class TodoRemoteRepositoryImpl implements TodoRemoteRepository {
  final NetworkInfo networkInfo;
  final TodoRemoteDatabase todoRemoteDataSource;

  TodoRemoteRepositoryImpl(
      {required this.networkInfo, required this.todoRemoteDataSource});

  @override
  Future<Either<Failure, Todo>> add(Todo todo) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await todoRemoteDataSource.addTodo(todo);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return right(response);
        } else {
          return left(Failure(
              statusCode: ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.INTERNAL_SERVER_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await todoRemoteDataSource.deleteTodo(todo);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return right(response);
        } else {
          return left(Failure(
              statusCode: ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.INTERNAL_SERVER_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await todoRemoteDataSource.editTodo(todo);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return right(response);
        } else {
          return left(Failure(
              statusCode: ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.INTERNAL_SERVER_ERROR.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await todoRemoteDataSource.listTodos();
        return right(response);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.INTERNAL_SERVER_ERROR.getFailure());
    }
  }
}
