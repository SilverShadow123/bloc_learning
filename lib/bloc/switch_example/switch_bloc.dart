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
    // This method is called when a SliderEvent is dispatched.
    // It emits a new state with the slider property set to the value of the slider.
    emit(state.copyWith(slider: event.slider));
  }



}