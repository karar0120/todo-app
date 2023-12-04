part of 'todo_item_cubit.dart';

abstract class TodoItemState extends Equatable {
  const TodoItemState();

  @override
  List<Object> get props => [];
}

class TodoItemInitial extends TodoItemState {}

class TodoItemLoading extends TodoItemState {}

class TodoItemLoaded extends TodoItemState {
  final List<Todo> item;
  const TodoItemLoaded({required this.item});
  @override
  List<Object> get props => [
        item,
      ];
}

class TodoItemError extends TodoItemState {
  final String error;
  const TodoItemError({required this.error});
  @override
  List<Object> get props => [
        error,
      ];
}
