import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/spacing.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_edit/widget/app_bar.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_edit/widget/title_and_desc_and_time.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_edit/widget/edit_task_button.dart';

import '../../../../../core/utils/values_manger.dart';

class TodoEditScreen extends StatelessWidget {
  final int id;
  const TodoEditScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoEditAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const TitleAndDescAndTime(),
            verticalSpace(AppSize.s14),
            EditTaskButton(
              id: id,
            ),
          ],
        ),
      ),
    );
  }
}
