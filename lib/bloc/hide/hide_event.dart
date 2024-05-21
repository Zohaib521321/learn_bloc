import 'package:equatable/equatable.dart';

abstract class HideEvent extends Equatable {
  const HideEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Hide extends HideEvent {}
