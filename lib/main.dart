import 'package:flutter/material.dart';
import 'package:todo_app/todo_app.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await initTodoItemModule();
  runApp(const TodoApp());
}
