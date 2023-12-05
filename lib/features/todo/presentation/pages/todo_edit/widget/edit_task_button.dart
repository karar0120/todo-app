import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/extensions.dart';
import 'package:todo_app/core/utils/strings_manger.dart';
import 'package:todo_app/core/widget/cubit/app_calendar_cubit.dart';
import 'package:todo_app/core/widget/custom_error_widget.dart';
import 'package:todo_app/core/widget/custom_loading_indicator.dart';
import 'package:todo_app/core/widget/toast_messages.dart';

import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/utils/values_manger.dart';
import '../../../../../../core/widget/app_text_button.dart';
import '../../../controller/todo_edit/todo_edit_cubit.dart';
import '../../../controller/todo_item/todo_item_cubit.dart';

class EditTaskButton extends StatelessWidget {
  final int id;
  const EditTaskButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoEditCubit, TodoEditState>(
      builder: (context, state) {
        if (state is TodoEditError) {
          return CustomErrorWidget(errMessage: state.error);
        } else if (state is TodoEditLoading) {
          return const CustomLoadingIndicator();
        } else {
          if (state is TodoEditLoaded) {
            context.read<TodoItemCubit>().getTodoItem();
            doneBotToast(title: AppString.sucessfullyEditedTask);
          }
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: AppTextButton(
              buttonHeight: AppSize.s70.h,
              buttonText: AppString.update,
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                validateThenUpdateTask(context);
              },
            ),
          );
        }
      },
    );
  }

  void validateThenUpdateTask(BuildContext context) {
    if (context.read<TodoEditCubit>().formKey.currentState!.validate()) {
      context.read<TodoEditCubit>().editTodoItem(
          id: id,
          dataTime:
              context.read<AppCalendarCubit>().selectedDateController.text);
      context.pop();
    }
  }
}
