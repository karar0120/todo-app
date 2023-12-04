import 'package:dartz/dartz.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/networking/error/failure.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class DeleteTodoUseCase implements BaseUseCase<Todo, Params<Todo>> {
  final TodoRepository repository;
  DeleteTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) async {
    return await repository.delete(params.data);
  }
}
