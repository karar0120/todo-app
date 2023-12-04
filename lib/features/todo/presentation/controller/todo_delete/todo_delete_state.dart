part of 'todo_delete_cubit.dart';

abstract class TodoDeleteState extends Equatable {
  const TodoDeleteState();

  @override
  List<Object> get props => [];
}

class TodoDeleteInitial extends TodoDeleteState {}

class TodoDeleteLoading extends TodoDeleteState {}

class TodoDeleteLoaded extends TodoDeleteState {}

class TodoDeleteError extends TodoDeleteState {
  final String error;
  const TodoDeleteError({required this.error});
  @override
  List<Object> get props => [
        error,
      ];
}
