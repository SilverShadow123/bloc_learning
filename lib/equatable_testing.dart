import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key, required this.title});

  final String title;

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  int _counter = 0;

  void _incrementCounter() {
    Person person = Person(name: 'John', age: 30);
    Person person2 = Person(name: 'John', age: 30);

    print(person.hashCode.toString());
    print(person2.hashCode.toString());

    print(person == person2);

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// By default, Dart compares objects by reference.
// This means that two objects are only equal if they are the exact same instance in memory.
// Equatable overrides the == operator and hashCode method to compare objects by their properties instead.
class Person extends Equatable{
  final String name;
  final int age;

  Person({required this.name, required this.age});
  // The props getter returns a list of the properties that should be used for comparison.
  @override
  List<Object?> get props => [name, age];

// @override
// bool operator ==(Object other) {
//   return identical(this, other) ||
//       other is Person &&
//           runtimeType == other.runtimeType &&
//           name == other.name &&
//           age == other.age;
// }
//
// @override
// int get hashCode => name.hashCode ^ age.hashCode;
}
