import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/dependency_injection.dart';
import 'package:todo_app/core/helper/extensions.dart';
import 'package:todo_app/core/theming/color.dart';
import 'package:todo_app/features/todo/presentation/controller/todo_item/todo_item_cubit.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_delete/widget/button_sheet_content.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_item/widget/app_bar.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_item/widget/todo_card.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widget/app_button_sheet.dart';

class TodoItemScreen extends StatelessWidget {
  const TodoItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<TodoItemCubit, TodoItemState>(
          builder: (context, state) {
            if (state is TodoItemLoaded) {
              return Column(
                  children: List.generate(state.item.length, (index) {
                return GestureDetector(
                    onTap: () {
                      initTodoDeleteModule();
                      showCustomBottomSheet(context,
                          bottomSheetContent: ButtonSheetContent(
                            index: state.item[index].id,
                          ),
                          bottomSheetHeight: 0.25);
                    },
                    child: TodoCard(todo: state.item[index]));
              }));
            } else if (state is TodoItemError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.darkBlue,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.pushNamed(Routes.todoAdd);
        },
      ),
    );
  }
}
