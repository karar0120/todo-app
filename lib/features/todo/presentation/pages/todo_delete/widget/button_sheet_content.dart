import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/extensions.dart';
import 'package:todo_app/core/utils/strings_manger.dart';
import 'package:todo_app/core/utils/values_manger.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_delete/todo_delete_cubit.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../domain/entities/todo.dart';
import '../../../controller/todo_edit/todo_edit_cubit.dart';
import '../../../controller/todo_item/todo_item_cubit.dart';

class ButtonSheetContent extends StatelessWidget {
  final int index;
  final Todo todo;
  const ButtonSheetContent({Key? key, required this.index, required this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p40.w, vertical: AppPadding.p40.h),
      children: [
        InkWell(
          onTap: () {
            context.pop();
            BlocProvider.of<TodoEditCubit>(context)
                .getTaskWantToEdit(todo: todo);
            context.pushNamed(Routes.todoUpdate, arguments: index);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p10.h),
            child: const Center(
              child: Text(
                AppString.edit,
              ),
            ),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: () {
            context.pop();
            BlocProvider.of<TodoDeleteCubit>(context).deleteTodoItem(id: index);
            BlocProvider.of<TodoItemCubit>(context).getTodoItem();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p10.h),
            child: const Center(
                child: Text(
              AppString.delete,
            )),
          ),
        ),
      ],
    );
  }
}
