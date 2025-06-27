import 'package:equatable/equatable.dart';

// Define an abstract class 'CounterEvent' that extends 'Equatable'.
// This class serves as the base class for all events related to the counter.
abstract class CounterEvent extends Equatable{

  // Constructor for the 'CounterEvent' class.
  const CounterEvent();
  // Override the 'props' getter from 'Equatable' to define the properties
  // that should be considered for equality comparison.
  // In this case, there are no specific properties, so it returns an empty list.
  @override
  List<Object?> get props => [];
}

// Define a class 'IncrementCounter' that extends 'CounterEvent'.
// This event represents the action of incrementing the counter.
class IncrementCounter extends CounterEvent{}

// Define a class 'DecrementCounter' that extends 'CounterEvent'.
// This event represents the action of decrementing the counter.
class DecrementCounter extends CounterEvent{}