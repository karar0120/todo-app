import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/todo/data/database/todo_local_database.dart';
import 'package:todo_app/features/todo/data/database/todo_remote_database.dart';
import 'package:todo_app/features/todo/domain/usecases/list.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_delete/todo_delete_cubit.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_item/todo_item_cubit.dart';

import '../../features/todo/data/repositories/todo_remote_repository_impl.dart';
import '../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../features/todo/domain/repositories/todo_remote_repository.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';
import '../../features/todo/domain/usecases/add.dart';
import '../../features/todo/domain/usecases/delete.dart';
import '../../features/todo/domain/usecases/edit.dart';
import '../../features/todo/presentation/controller/todo_add/todo_add_cubit.dart';
import '../../features/todo/presentation/controller/todo_edit/todo_edit_cubit.dart';
import '../helper/app_prefs.dart';
import '../networking/app_service_client/app_service_client.dart';
import '../networking/app_service_client/dio_factory.dart';
import '../networking/app_service_client/network_info.dart';
import '../networking/sql/sqlite_service.dart';

final getIt = GetIt.instance;

/// we put all our dependency injection in this function
Future<void> setupGetIt() async {
  // Dio & Database
  final Database db = await SqliteService.initializeDB();
  getIt.registerLazySingleton<TodoLocalDatabase>(
      () => TodoLocalDatabaseImpl(db: db));

  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(remoteDatabase: getIt()));
}

Future<void> initTodoItemModule() async {
  if (!GetIt.I.isRegistered<ListTodoUseCase>()) {
    getIt.registerFactory<ListTodoUseCase>(
        () => ListTodoUseCase(repository: getIt()));

    getIt.registerFactory<TodoItemCubit>(
        () => TodoItemCubit(listTodoUseCase: getIt()));
  }

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sharedPreferences: getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));

  getIt.registerLazySingleton<DioFactory>(
      () => DioFactory(appPreferences: getIt()));

  Dio dio = await getIt<DioFactory>().getDio();

  getIt.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  getIt.registerLazySingleton<TodoRemoteDatabase>(
      () => TodoRemoteDatabaseImpl(appServiceClient: getIt()));

  getIt.registerLazySingleton<TodoRemoteRepository>(
      () => TodoRemoteRepositoryImpl(
            networkInfo: getIt(),
            todoRemoteDataSource: getIt(),
          ));
}

Future<void> initTodoAddModule() async {
  if (!GetIt.I.isRegistered<AddTodoUseCase>()) {
    getIt.registerFactory<AddTodoUseCase>(
        () => AddTodoUseCase(repository: getIt()));

    getIt.registerFactory<TodoAddCubit>(
        () => TodoAddCubit(addTodoUseCase: getIt()));
  }
}

Future<void> initTodoEditModule() async {
  if (!GetIt.I.isRegistered<EditTodoUseCase>()) {
    getIt.registerFactory<EditTodoUseCase>(
        () => EditTodoUseCase(repository: getIt()));

    getIt.registerFactory<TodoEditCubit>(
        () => TodoEditCubit(editTodoUseCase: getIt()));
  }
}

Future<void> initTodoDeleteModule() async {
  if (!GetIt.I.isRegistered<DeleteTodoUseCase>()) {
    getIt.registerFactory<DeleteTodoUseCase>(
        () => DeleteTodoUseCase(repository: getIt()));

    getIt.registerFactory<TodoDeleteCubit>(
        () => TodoDeleteCubit(deleteTodoUseCase: getIt()));
  }
}
