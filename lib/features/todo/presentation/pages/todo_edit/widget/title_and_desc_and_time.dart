import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/core/utils/strings_manger.dart';
import 'package:todo_app/core/utils/values_manger.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_edit/todo_edit_cubit.dart';

import '../../../../../../core/widget/app_text_form_field.dart';
import '../../../../../../core/widget/cubit/app_calendar_cubit.dart';

class TitleAndDescAndTime extends StatelessWidget {
  const TitleAndDescAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<TodoEditCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          children: [
            verticalSpace(AppSize.s20),
            AppTextFormField(
              hintText: AppString.title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<TodoEditCubit>().titleController,
            ),
            verticalSpace(AppSize.s16),
            AppTextFormField(
              hintText: AppString.description,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<TodoEditCubit>().descriptionController,
            ),
            verticalSpace(AppSize.s16),
            AppTextFormField(
                readOnly: true,
                onTap: () {
                  BlocProvider.of<AppCalendarCubit>(context)
                      .selectDate(context)
                      .then((value) => context
                          .read<TodoEditCubit>()
                          .dataTimeController
                          .text = value!);
                },
                hintText: AppString.dateTime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                },
                controller: context.read<TodoEditCubit>().dataTimeController),
          ],
        ),
      ),
    );
  }
}
