part of 'todo_edit_cubit.dart';

abstract class TodoEditState extends Equatable {
  const TodoEditState();

  @override
  List<Object> get props => [];
}

class TodoEditInitial extends TodoEditState {}

class TodoEditLoading extends TodoEditState {}

class TodoEditLoaded extends TodoEditState {}

class TodoEditError extends TodoEditState {
  final String error;
  const TodoEditError({required this.error});
  @override
  List<Object> get props => [
        error,
      ];
}

class TodoEditGetData extends TodoEditState {}
