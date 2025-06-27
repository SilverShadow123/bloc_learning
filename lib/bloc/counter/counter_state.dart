import 'package:equatable/equatable.dart';

// Define a class named 'CounterState' that extends 'Equatable'.
// This means instances of 'CounterState' can be compared based on their properties.
class CounterState extends Equatable {
  // Declare a final integer variable named 'counter'.
  // 'final' means its value can only be set once, typically during object creation.
  final int counter;

  // Define a constant constructor for 'CounterState'.
  // It takes an optional named parameter 'counter' with a default value of 0.
  // 'this.counter' assigns the passed 'counter' value to the instance's 'counter' field.
  const CounterState({this.counter = 0});

  // Define a method named 'copyWith'.
  // This method is a common pattern in immutable state management.
  // It creates a new 'CounterState' instance with potentially updated values.
  CounterState copyWith({int? counter}) {
    // Return a new 'CounterState' instance.
    // If 'counter' is provided (not null), use its value.
    // Otherwise (if 'counter' is null), use the current instance's 'counter' value ('this.counter').
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  // Override the 'props' getter from the 'Equatable' class.
  // 'props' returns a list of properties that should be used for equality comparison.
  List<Object?> get props => [counter];
}