import 'package:flutter/material.dart';

class Freezed extends StatefulWidget {
  const Freezed({super.key});

  @override
  State<Freezed> createState() => _FreezedState();
}

class _FreezedState extends State<Freezed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person personModel = Person("John", 25);
        Person personModel2 = Person("John", 25);
        print(personModel.name.toString());
        print(personModel.hashCode.toString());
        print(personModel2.hashCode.toString());
        print(personModel==personModel2);
      }),
    );
  }
}

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
