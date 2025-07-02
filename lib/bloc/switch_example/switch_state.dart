import 'package:equatable/equatable.dart';

// Represents the state of a switch, extending Equatable for easy comparison.
class SwitchStates extends Equatable{
  // Boolean indicating whether the switch is on or off.
  bool isSwitch;
  double slider;

  // Constructor with a default value of false for isSwitch.
  SwitchStates({this.isSwitch = false, this.slider = 1.0});

  // Creates a copy of the current SwitchStates object with an optional new value for isSwitch.
  // If isSwitch is not provided, the current value of isSwitch is used.
  SwitchStates copyWith({bool? isSwitch, double? slider}){
    return SwitchStates(
      isSwitch: isSwitch?? this.isSwitch,
      slider: slider?? this.slider,
    );
}

  // Overrides the props getter from Equatable to include isSwitch for comparison.
  @override
  List<Object?> get props => [isSwitch, slider];

}