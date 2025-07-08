import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodo extends TodoEvent {

  final String task;
  const AddTodo({required this.task});


  @override
  List<Object> get props => [task];
}
class RemoveTodo extends TodoEvent {
  final Object task;
  const RemoveTodo({required this.task});

  @override
  List<Object> get props => [task];
}