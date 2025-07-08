import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/todo/todo_event.dart';
import 'package:bloc_learning/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  final List<String> todosList = [];
  TodoBloc(): super(const TodoState()){
    on<AddTodo>(_addTodo);
    on<RemoveTodo>(_removeTodo);
  }
void _addTodo(AddTodo event, Emitter<TodoState> emit) {
  todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

  void _removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
  todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}