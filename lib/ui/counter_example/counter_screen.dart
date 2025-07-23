import 'package:bloc_learning/bloc/counter/counter_bloc.dart';
import 'package:bloc_learning/bloc/counter/counter_state.dart';
import 'package:bloc_learning/ui/posts/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/counter/counter_event.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    _counterBloc = CounterBloc();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Counter Example')),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostsScreen()),
                );
              },
              icon: Icon(Icons.navigate_next),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) =>false,
                  builder: (context, state) {
                    print('tapped');
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text('Increment'),
                    );
                  },
                ),
                SizedBox(width: 20),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text('Decrement'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
