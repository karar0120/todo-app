import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/extensions.dart';
import 'package:todo_app/core/utils/strings_manger.dart';
import 'package:todo_app/core/widget/cubit/app_calendar_cubit.dart';

import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/utils/values_manger.dart';
import '../../../../../../core/widget/app_text_button.dart';
import '../../../controller/todo_add/todo_add_cubit.dart';
import '../../../controller/todo_item/todo_item_cubit.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoAddCubit, TodoAddState>(
      builder: (context, state) {
        if (state is TodoAddError) {
          return Text(state.error);
        } else if (state is TodoAddLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (state is TodoAddLoaded) {
            context.read<TodoItemCubit>().getTodoItem();
          }
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: AppTextButton(
              buttonHeight: AppSize.s70.h,
              buttonText: AppString.add,
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                validateThenAddTask(context);
              },
            ),
          );
        }
      },
    );
  }

  void validateThenAddTask(BuildContext context) {
    if (context.read<TodoAddCubit>().formKey.currentState!.validate()) {
      context.read<TodoAddCubit>().addTodoItem(
          dataTime:
              context.read<AppCalendarCubit>().selectedDateController.text);
      context.pop();
    }
  }
}
