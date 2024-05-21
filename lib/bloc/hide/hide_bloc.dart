import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/hide/hide_event.dart';
import 'package:bloc_learn/bloc/hide/hide_state.dart';

class HideBloc extends Bloc<HideEvent, HideState> {
  HideBloc() : super(const HideState()) {
    on<Hide>(_toggle);
  }

  void _toggle(Hide event, Emitter<HideState> emit) {
    emit(state.copyWith(show: !state.show));
  }
}
