import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/base_use_case/base_use_case.dart';

import '../../../domain/entities/todo.dart';
import '../../../domain/usecases/edit.dart';

part 'todo_edit_state.dart';

class TodoEditCubit extends Cubit<TodoEditState> {
  TodoEditCubit({required this.editTodoUseCase}) : super(TodoEditInitial());
  final EditTodoUseCase editTodoUseCase;
  var formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dataTimeController = TextEditingController();

  Future<void> editTodoItem({required String dataTime, required int id}) async {
    emit(TodoEditLoading());
    final results = await editTodoUseCase(Params(Todo(
        id: id,
        title: titleController.text,
        description: descriptionController.text,
        dataTime: dataTimeController.text)));
    results.fold((failure) => emit(TodoEditError(error: failure.message)),
        (data) => emit(TodoEditLoaded()));
  }

  void getTaskWithId({required Todo todo}) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    dataTimeController.text = todo.dataTime;
    emit(TodoEditGetData());
  }
}
