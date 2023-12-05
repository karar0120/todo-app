import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_add/widget/add_task_button.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_add/widget/app_bar.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_add/widget/title_and_desc_and_time.dart';

import '../../../../../core/utils/values_manger.dart';

class TodoAddScreen extends StatelessWidget {
  const TodoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAddAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const TitleAndDescAndTime(),
            verticalSpace(AppSize.s14),
            const AddTaskButton(),
          ],
        ),
      ),
    );
  }
}
