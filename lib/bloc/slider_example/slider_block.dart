import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/slider_example/slider_event.dart';
import 'package:bloc_learn/bloc/slider_example/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderState()) {
    on<ChangeSlider>(_change);
  }
  void _change(ChangeSlider event, Emitter<SliderState> emit) {
    emit(state.copyWith(value: event.value));
  }
}
