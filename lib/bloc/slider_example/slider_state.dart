import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double value;
  const SliderState({this.value = 0.02});
  SliderState copyWith({double? value}) {
    return SliderState(value: value ?? this.value);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [value];
}
