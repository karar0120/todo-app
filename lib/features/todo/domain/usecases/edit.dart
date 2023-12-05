import 'package:dartz/dartz.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/networking/error/failure.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class EditTodoUseCase implements BaseUseCase<Todo, Params<Todo>> {
  final TodoRepository repository;
  EditTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) async {
    return await repository.edit(params.data);
  }
}
