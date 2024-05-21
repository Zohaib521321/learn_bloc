import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeSlider extends SliderEvent {
  final double value;
  ChangeSlider({required this.value});
  @override
  List<Object> get props => [value];
}
