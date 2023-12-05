import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/extensions.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/core/utils/strings_manger.dart';
import 'package:todo_app/core/utils/values_manger.dart';
import 'package:todo_app/core/widget/toast_messages.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_delete/todo_delete_cubit.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widget/app_alert_dialog.dart';
import '../../../../domain/entities/todo.dart';
import '../../../controller/todo_edit/todo_edit_cubit.dart';
import '../../../controller/todo_item/todo_item_cubit.dart';

class ButtonSheetContent extends StatelessWidget {
  final Todo todo;
  const ButtonSheetContent({Key? key, required this.todo}) : super(key: key);

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
            BlocProvider.of<TodoEditCubit>(context).getTaskWithId(todo: todo);
            context.pushNamed(Routes.todoUpdate, arguments: todo.id);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p10.h),
            child: Center(
              child: Text(
                AppString.edit,
                style: TextStyles.font16BlueSemiBold,
              ),
            ),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: () {
            showAlertDialogContinue(context, continuePressed: () {
              context.pop();
              context.pop();
              BlocProvider.of<TodoDeleteCubit>(context)
                  .deleteTodoItem(id: todo.id);
              BlocProvider.of<TodoItemCubit>(context).getTodoItem();
              doneBotToast(title: AppString.sucessfullyDeletedTask);
            }, content: AppString.areYouSureToDeleteTask);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p10.h),
            child: Center(
                child: Text(
              AppString.delete,
              style: TextStyles.font16BlueSemiBold.copyWith(color: Colors.red),
            )),
          ),
        ),
      ],
    );
  }
}
