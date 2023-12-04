import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/dependency_injection.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/features/todo/domain/usecases/add.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_add/todo_add_cubit.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_add/todo_add_screen.dart';

import '../../features/todo/presentation/pages/todo_item/todo_item_screen.dart';
import '../utils/strings_manger.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const TodoItemScreen());
      case Routes.todoAdd:
        initTodoAddModule();
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      TodoAddCubit(addTodoUseCase: getIt<AddTodoUseCase>()),
                  child: const TodoAddScreen(),
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
