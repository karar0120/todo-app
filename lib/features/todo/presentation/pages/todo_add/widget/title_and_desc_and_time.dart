import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/core/utils/strings_manger.dart';
import 'package:todo_app/core/utils/values_manger.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_add/todo_add_cubit.dart';

import '../../../../../../core/widget/app_text_form_field.dart';
import '../../../../../../core/widget/cubit/app_calendar_cubit.dart';

class TitleAndDescAndTime extends StatelessWidget {
  const TitleAndDescAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<TodoAddCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          children: [
            verticalSpace(AppSize.s20),
            AppTextFormField(
              hintText: AppString.title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppString.pleaseEnterAValidTitle;
                }
              },
              controller: context.read<TodoAddCubit>().titleController,
            ),
            verticalSpace(AppSize.s16),
            AppTextFormField(
              hintText: AppString.description,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppString.pleaseEnterAValidDescription;
                }
              },
              controller: context.read<TodoAddCubit>().descriptionController,
            ),
            verticalSpace(AppSize.s16),
            AppTextFormField(
              readOnly: true,
              onTap: () {
                BlocProvider.of<AppCalendarCubit>(context)
                    .selectDate(context)
                    .then((value) {
                  context.read<TodoAddCubit>().dataTimeController.text =
                      (DateFormat.yMMMEd().format(DateTime.parse(value!)));
                });
              },
              hintText: AppString.dateTime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppString.pleaseEnterAValidDateTime;
                }
              },
              controller: context.read<TodoAddCubit>().dataTimeController,
            ),
          ],
        ),
      ),
    );
  }
}
