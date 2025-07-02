import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/switch_example/switch_event.dart';
import 'package:bloc_learning/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates>{
  SwitchBloc():super(SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderEvent);
  }
  // This method is called when an EnableOrDisableNotification event is dispatched.
  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchStates> emit){
    // It emits a new state with the isSwitch property toggled.
    // state.copyWith creates a new instance of SwitchStates based on the current state.
    // isSwitch: !state.isSwitch sets the isSwitch property of the new state to the opposite of its current value.
    // For example, if state.isSwitch is true, the new state's isSwitch will be false, and vice-versa.
    // This effectively toggles the switch.
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _sliderEvent(SliderEvent event, Emitter<SwitchStates> emit){
    // This method is called when a SliderEvent is dispatched (e.g., when the user interacts with a slider UI element).
    // The `event` parameter contains the data associated with this specific event. In this case, `event.slider` holds the new value of the slider.
    // The `emit` parameter is a function provided by the BLoC library that allows us to output a new state.

    // `state.copyWith(...)` is used to create a *new* instance of `SwitchStates` based on the current `state`.
    // This is a common pattern in BLoC (and functional programming in general) to ensure immutability.
    // Instead of directly modifying the current state, we create a new one with the desired changes.

    // `slider: event.slider.toDouble()` is the core of the state update.
    // We are setting the `slider` property of the *new* state to the value received from the `SliderEvent`.
    // `event.slider` provides the most up-to-date value that triggered this event (e.g., the position the user just dragged the slider to).
    // `.toDouble()` ensures the value is a double, which is likely the expected type for the `slider` property in `SwitchStates`.

    // Why `event.slider` and not `state.slider`?
    // - `event.slider`: This is the *new* value that just occurred. It represents the change that happened.
    // - `state.slider`: This is the *current* value of the slider stored in the BLoC's state *before* this event is processed.
    // If we used `state.slider` here, we would essentially be emitting a new state with the same slider value it already had,
    // meaning the UI wouldn't reflect the user's latest interaction with the slider.
    // The purpose of this event handler is to update the state to reflect the *new* slider value provided by the `event`.
    emit(state.copyWith(slider: event.slider.toDouble()));
  }



}