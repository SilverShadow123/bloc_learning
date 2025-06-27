import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

// Define the CounterBloc class, which extends the Bloc class with CounterEvent as the event type and CounterState as the state type.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constructor for the CounterBloc.
  // The `super(const CounterState())` call invokes the constructor of the parent class (Bloc).
  // This is necessary because CounterBloc inherits from Bloc, and the Bloc class requires an initial state to be provided
  // when an instance of a Bloc (or a class that extends Bloc) is created.
  // It initializes the Bloc with an initial state of CounterState().
  CounterBloc() : super(const CounterState()) {
    // Register an event handler for the IncrementCounter event.
    // When an IncrementCounter event is received, the _increment method will be called.
    // The `on` method is a part of the Bloc library and is used to register event handlers.
    // It takes two arguments:
    // 1. The type of the event to handle (e.g., IncrementCounter).
    // 2. A callback function that will be executed when an event of the specified type is received.
    // This callback function typically takes the event and an Emitter as arguments.
    // The Emitter is used to emit new states.
    on<IncrementCounter>(_increment);
    // Register an event handler for the DecrementCounter event.
    // When a DecrementCounter event is received, the _decrement method will be called.
    on<DecrementCounter>(_decrement);
  }

  // Method to handle the IncrementCounter event.
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    // Emit a new state by copying the current state and incrementing the counter value.
    emit(state.copyWith(counter: state.counter + 1));
  }
  // Method to handle the DecrementCounter event.
  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    // Emit a new state by copying the current state and decrementing the counter value.
    emit(state.copyWith(counter: state.counter - 1));
  }
}
