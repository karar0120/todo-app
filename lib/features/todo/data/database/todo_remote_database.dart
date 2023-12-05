import '../../../../core/networking/app_service_client/app_service_client.dart';
import '../../domain/entities/todo.dart';
import '../model/todo_model.dart';

abstract class TodoRemoteDatabase {
  Future addTodo(Todo todo);

  Future editTodo(Todo todo);

  Future deleteTodo(Todo todo);

  Future<List<TodoModel>> listTodos();
}

class TodoRemoteDatabaseImpl implements TodoRemoteDatabase {
  final AppServiceClient appServiceClient;

  const TodoRemoteDatabaseImpl({required this.appServiceClient});

  @override
  Future addTodo(Todo todo) async {
    return await appServiceClient.createTask(
        todo.title, todo.description, todo.dataTime);
  }

  @override
  Future deleteTodo(Todo todo) async {
    return await appServiceClient.deleteTask(todo.id);
  }

  @override
  Future editTodo(Todo todo) async {
    return await appServiceClient.updateTask(
        todo.id, todo.title, todo.description, todo.dataTime);
  }

  @override
  Future<List<TodoModel>> listTodos() async {
    return await appServiceClient.home();
  }
}
