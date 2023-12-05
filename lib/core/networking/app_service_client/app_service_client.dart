import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

import '../../helper/constance.dart';
part 'app_service_client.g.dart';

@RestApi(baseUrl: Constance.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constance.pathCreateTask)
  Future createTask(
    @Field('title') String title,
    @Field('description') String description,
    @Field('dateTime') String dateTime,
  );

  @PUT(Constance.pathEditTask)
  Future updateTask(
    @Field('id') int id,
    @Field('title') String title,
    @Field('description') String description,
    @Field('dateTime') String dateTime,
  );

  @DELETE(Constance.pathDeleteTask)
  Future deleteTask(@Field('id') int id);

  @GET(Constance.pathTask)
  Future<List<TodoModel>> home();
}
