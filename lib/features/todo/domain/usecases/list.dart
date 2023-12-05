import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/networking/error/failure.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class ListTodoUseCase implements BaseUseCase<List<Todo>, NoParams> {
  final TodoRepository repository;

  ListTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
