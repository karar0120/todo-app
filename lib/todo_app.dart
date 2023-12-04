import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/theme_manger.dart';
import 'core/utils/strings_manger.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.todoApp,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
