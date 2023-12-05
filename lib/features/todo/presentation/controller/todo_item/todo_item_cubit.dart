import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/base_use_case/base_use_case.dart';
import 'package:todo_app/features/todo/domain/usecases/list.dart';

import '../../../domain/entities/todo.dart';

part 'todo_item_state.dart';

class TodoItemCubit extends Cubit<TodoItemState> {
  TodoItemCubit({required this.listTodoUseCase}) : super(TodoItemInitial());
  final ListTodoUseCase listTodoUseCase;

  Future<void> getTodoItem() async {
    emit(TodoItemLoading());
    final results = await listTodoUseCase(const NoParams());
    results.fold((failure) => emit(TodoItemError(error: failure.message)),
        (data) => emit(TodoItemLoaded(item: data)));
  }
}
