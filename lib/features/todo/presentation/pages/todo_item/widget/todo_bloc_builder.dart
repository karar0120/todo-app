import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_item/widget/todo_card.dart';

import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/utils/values_manger.dart';
import '../../../../../../core/widget/app_button_sheet.dart';
import '../../../../../../core/widget/custom_error_widget.dart';
import '../../../../../../core/widget/custom_loading_indicator.dart';
import '../../../../../../core/widget/no_record_found.dart';
import '../../../../domain/entities/todo.dart';
import '../../../../domain/usecases/delete.dart';
import '../../../controller/todo_delete/todo_delete_cubit.dart';
import '../../../controller/todo_item/todo_item_cubit.dart';
import '../../todo_delete/widget/button_sheet_content.dart';

class TodoBlocBuilder extends StatelessWidget {
  final TodoItemState state;
  const TodoBlocBuilder({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return _buildTodoItem(state, context);
  }

  Widget _buildTodoItem(TodoItemState state, context) {
    if (state is TodoItemLoaded) {
      if (state.item.isEmpty) {
        return noRecordFound();
      } else {
        return Column(
            children: List.generate(state.item.length, (index) {
          return GestureDetector(
              onTap: () {
                openButtonSheet(context: context, todo: state.item[index]);
              },
              child: TodoCard(todo: state.item[index]));
        }));
      }
    } else if (state is TodoItemError) {
      return CustomErrorWidget(
        errMessage: state.error,
      );
    } else {
      return const CustomLoadingIndicator();
    }
  }

  void openButtonSheet({required context, required Todo todo}) {
    initTodoDeleteModule();
    initTodoEditModule();
    showCustomBottomSheet(context,
        bottomSheetContent: BlocProvider<TodoDeleteCubit>(
          create: (context) =>
              TodoDeleteCubit(deleteTodoUseCase: getIt<DeleteTodoUseCase>()),
          child: ButtonSheetContent(
            todo: todo,
          ),
        ),
        bottomSheetHeight: AppSize.s0_25);
  }
}
