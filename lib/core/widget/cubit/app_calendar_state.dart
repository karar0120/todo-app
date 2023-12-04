part of 'app_calendar_cubit.dart';

abstract class AppCalendarState extends Equatable {
  const AppCalendarState();

  @override
  List<Object> get props => [];
}

class AppCalendarInitial extends AppCalendarState {}

class AppCalendarSelecetedDate extends AppCalendarState {}

class InitialSelecetedDate extends AppCalendarState {}
