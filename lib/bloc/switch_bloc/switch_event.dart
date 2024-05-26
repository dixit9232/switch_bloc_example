import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  @override
  List<Object?> get props => [];

  const SwitchEvents();
}

class EnableOrDisableSwitch extends SwitchEvents {}

class SliderValue extends SwitchEvents {
  final double slider;

  const SliderValue({required this.slider});

  @override
  // TODO: implement props
  List<Object?> get props => [slider];
}
