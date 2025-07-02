import 'package:equatable/equatable.dart';

// `SwitchEvent` is an abstract class that extends `Equatable`.
// This means that all classes that extend `SwitchEvent` will be able to be compared for equality based on their props.
abstract class SwitchEvent extends Equatable {
  // The constructor for `SwitchEvent` is const, which means that it can be used to create compile-time constants.
  const SwitchEvent();

  // The `props` getter returns a list of the properties that should be used to determine equality.
  @override
  List<Object> get props => [];
}

// `EnableOrDisableNotification` is a class that extends `SwitchEvent`.
// This means that it is an event that can be dispatched to the `SwitchBloc` to enable or disable notifications.
class EnableOrDisableNotification extends SwitchEvent {

}

class SliderEvent extends SwitchEvent {
double slider;
SliderEvent({required this.slider});
  @override
  List<Object> get props => [slider];
}