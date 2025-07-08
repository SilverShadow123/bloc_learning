import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_event.dart';
import '../../../bloc/todo/todo_state.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i =0; i < 1; i++) {
            context.read<TodoBloc>().add(AddTodo(task: 'To-Do Item' + i.toString()));
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(child: Text('No To-Do items available.'));
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('To-Do Item ${index + 1}'),
                  subtitle: const Text(
                    'This is a description of the to-do item.',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete action
                      context.read<TodoBloc>().add(
                        RemoveTodo(task: state.todosList[index]),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
