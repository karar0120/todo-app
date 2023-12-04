import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/base_use_case/base_use_case.dart';

import '../../../domain/entities/todo.dart';
import '../../../domain/usecases/delete.dart';

part 'todo_delete_state.dart';

class TodoDeleteCubit extends Cubit<TodoDeleteState> {
  TodoDeleteCubit({required this.deleteTodoUseCase})
      : super(TodoDeleteInitial());
  final DeleteTodoUseCase deleteTodoUseCase;
  var formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dataTimeController = TextEditingController();

  Future<void> deleteTodoItem() async {
    emit(TodoDeleteLoading());
    final results = await deleteTodoUseCase(Params(Todo(
        id: 1,
        title: titleController.text,
        description: descriptionController.text,
        dataTime: dataTimeController.text)));
    results.fold((failure) => emit(TodoDeleteError(error: failure.message)),
        (data) => emit(TodoDeleteLoaded()));
  }
}
