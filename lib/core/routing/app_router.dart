import 'package:flutter/material.dart';
import 'package:todo_app/core/routing/routes.dart';

import '../../features/todo/presentation/pages/todo_item/todo_item_screen.dart';
import '../utils/strings_manger.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const TodoItemScreen());

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
