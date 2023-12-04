import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String dataTime;
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.dataTime,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        dataTime,
      ];
}
