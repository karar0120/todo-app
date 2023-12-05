import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/theme_manger.dart';
import 'core/utils/strings_manger.dart';
import 'core/utils/values_manger.dart';
import 'features/todo/domain/usecases/edit.dart';
import 'features/todo/domain/usecases/list.dart';
import 'features/todo/presentation/controller/todo_edit/todo_edit_cubit.dart';
import 'features/todo/presentation/controller/todo_item/todo_item_cubit.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppSize.s414, AppSize.s896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<TodoItemCubit>(
              create: (BuildContext context) =>
                  TodoItemCubit(listTodoUseCase: getIt<ListTodoUseCase>())
                    ..getTodoItem(),
            ),
            BlocProvider<TodoEditCubit>(
              create: (BuildContext context) =>
                  TodoEditCubit(editTodoUseCase: getIt<EditTodoUseCase>()),
            ),
          ],
          child: MaterialApp(
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            title: AppString.todoApp,
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            initialRoute: Routes.home,
            onGenerateRoute: AppRoute.generateRoute,
          ),
        );
      },
    );
  }
}
