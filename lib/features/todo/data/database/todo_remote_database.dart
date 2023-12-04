import 'package:sqflite/sqflite.dart';
import '../../../../core/networking/sql/sqlite_service.dart';
import '../../domain/entities/todo.dart';
import '../model/todo_model.dart';

abstract class TodoRemoteDatabase {
  Future<Todo> addTodo(Todo todo);

  Future<Todo> editTodo(Todo todo);

  Future<Todo> deleteTodo(Todo todo);

  Future<List<TodoModel>> listTodos();
}

class TodoRemoteDatabaseImpl implements TodoRemoteDatabase {
  @override
  Future<Todo> addTodo(Todo todo) async {
    final Database db = await SqliteService.initializeDB();
    await db.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO task(title,description,time) VALUES ("${todo.title}","${todo.description}","${todo.dataTime}")');
    });
    return todo;
  }

  @override
  Future<Todo> deleteTodo(Todo todo) async {
    final Database db = await SqliteService.initializeDB();
    await db.rawDelete('DELETE FROM task WHERE id = ?', [todo.id]);
    return todo;
  }

  @override
  Future<Todo> editTodo(Todo todo) async {
    final Database db = await SqliteService.initializeDB();
    await db.rawUpdate(
        'UPDATE task SET title = ? , description =? , time = ?  WHERE id = ?',
        [todo.title, todo.description, todo.dataTime, todo.id]);
    return todo;
  }

  @override
  Future<List<TodoModel>> listTodos() async {
    final Database db = await SqliteService.initializeDB();
    final response = await db.rawQuery('SELECT * FROM task');
    return List<TodoModel>.from((response).map((e) => TodoModel.fromMap(e)));
  }
}
