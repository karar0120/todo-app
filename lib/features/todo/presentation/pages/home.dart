import 'package:flutter/material.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../data/database/todo_remote_database.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/add.dart';
import '../../domain/usecases/delete.dart';
import '../../domain/usecases/edit.dart';
import '../../domain/usecases/list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AddTodoUseCase addTodoUseCase = AddTodoUseCase(
      TodoRepositoryImpl(remoteDatabase: TodoRemoteDatabaseImpl()));

  final ListTodoUseCase listTodoUseCase = ListTodoUseCase(
      TodoRepositoryImpl(remoteDatabase: TodoRemoteDatabaseImpl()));

  final DeleteTodoUseCase deleteTodoUseCase = DeleteTodoUseCase(
      TodoRepositoryImpl(remoteDatabase: TodoRemoteDatabaseImpl()));

  final EditTodoUseCase editTodoUseCase = EditTodoUseCase(
      TodoRepositoryImpl(remoteDatabase: TodoRemoteDatabaseImpl()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Todo todo = const Todo(
                    id: 1, title: "asas", description: "as", dataTime: "a");
                addTodoUseCase.call(Params(todo));
              },
              child: const Text("Add"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Todo todo = const Todo(
                    id: 3,
                    title: "karar",
                    description: "omer",
                    dataTime: "kaled");
                editTodoUseCase.call(Params(todo));
              },
              child: const Text("edit"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Todo todo = const Todo(
                    id: 1, title: "asas", description: "as", dataTime: "a");
                deleteTodoUseCase.call(Params(todo));
              },
              child: const Text("delete"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                listTodoUseCase
                    .call(const NoParams())
                    .then((value) => print(value));
              },
              child: const Text("list"),
            ),
          ),
        ],
      ),
    );
  }
}
