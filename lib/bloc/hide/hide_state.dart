import 'package:equatable/equatable.dart';

class HideState extends Equatable {
  final bool show;
  const HideState({this.show = false});

  HideState copyWith({bool? show}) {
    return HideState(show: show ?? this.show);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [show];
}
