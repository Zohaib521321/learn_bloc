import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool change;
  const SwitchState({this.change = false});

  SwitchState copyWith({bool? change}) {
    return SwitchState(change: change ?? this.change);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [change];
}
