import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/base_use_case/base_use_case.dart';
import 'package:todo_app/features/todo/domain/usecases/add.dart';

import '../../../domain/entities/todo.dart';

part 'todo_add_state.dart';

class TodoAddCubit extends Cubit<TodoAddState> {
  TodoAddCubit({required this.addTodoUseCase}) : super(TodoAddInitial());
  final AddTodoUseCase addTodoUseCase;
  var formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> addTodoItem({required String dataTime}) async {
    emit(TodoAddLoading());
    final results = await addTodoUseCase(Params(Todo(
        id: 1,
        title: titleController.text,
        description: descriptionController.text,
        dataTime: dataTime)));
    results.fold((failure) => emit(TodoAddError(error: failure.message)),
        (data) => emit(TodoAddLoaded()));
  }
}
