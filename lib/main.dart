import 'package:bloc_learning/bloc/counter/counter_bloc.dart';
import 'package:bloc_learning/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_learning/bloc/todo/todo_bloc.dart';
import 'package:bloc_learning/ui/counter_example/counter_screen.dart';
import 'package:bloc_learning/ui/image_picker/image_picker_example.dart';
import 'package:bloc_learning/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_learning/ui/todo/todo_screen/to_do_screen.dart';
import 'package:bloc_learning/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch_example/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context)=> TodoBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ToDoScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
