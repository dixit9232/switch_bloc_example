import 'package:bloc/bloc.dart';
import 'package:switch_bloc_example/bloc/switch_bloc/switch_event.dart';
import 'package:switch_bloc_example/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc(super.initialState) {
    on<EnableOrDisableSwitch>(_enableOrDisableSwitch);
    on<SliderValue>(_slider);
  }

  void _enableOrDisableSwitch(EnableOrDisableSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderValue event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
