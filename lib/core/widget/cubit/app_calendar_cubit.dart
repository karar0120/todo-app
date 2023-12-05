import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'app_calendar_state.dart';

class AppCalendarCubit extends Cubit<AppCalendarState> {
  AppCalendarCubit() : super(AppCalendarInitial());

  DateTime selectedDate = DateTime.now();
  final TextEditingController selectedDateController = TextEditingController();
  Future<String?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedDateController.text = selectedDate.toString();
      emit(AppCalendarSelecetedDate());
    }
    return selectedDateController.text;
  }
}
