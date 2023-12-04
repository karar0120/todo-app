import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.loginScreen:
      //   return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
