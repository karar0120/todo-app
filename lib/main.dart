import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/widget/cubit/app_calendar_cubit.dart';
import 'package:todo_app/features/todo/domain/usecases/list.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_item/todo_item_cubit.dart';
import 'package:todo_app/todo_app.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await initTodoItemModule();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TodoItemCubit>(
      create: (BuildContext context) =>
          TodoItemCubit(listTodoUseCase: getIt<ListTodoUseCase>())
            ..getTodoItem(),
    ),
    BlocProvider<AppCalendarCubit>(create: (context) => AppCalendarCubit())
  ], child: const TodoApp()));
}
