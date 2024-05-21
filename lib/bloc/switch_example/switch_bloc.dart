import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/switch_example/switch_event.dart';
import 'package:bloc_learn/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<OnChangeSwitch>(_changeValue);
  }
  void _changeValue(OnChangeSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(change: !state.change));
  }
}
