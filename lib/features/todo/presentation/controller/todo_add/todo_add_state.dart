part of 'todo_add_cubit.dart';

abstract class TodoAddState extends Equatable {
  const TodoAddState();

  @override
  List<Object> get props => [];
}

class TodoAddInitial extends TodoAddState {}

class TodoAddLoading extends TodoAddState {}

class TodoAddLoaded extends TodoAddState {}

class TodoAddError extends TodoAddState {
  final String error;
  const TodoAddError({required this.error});
  @override
  List<Object> get props => [
        error,
      ];
}
