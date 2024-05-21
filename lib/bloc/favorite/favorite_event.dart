import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Remove extends FavoriteEvent {
  final int index;
  Remove(this.index);
  @override
  List<Object?> get props => [index];
}

class Add extends FavoriteEvent {
  final String item;
  Add(this.item);
  @override
  List<Object?> get props => [item];
}

class RemoveText extends FavoriteEvent {
  final String item;
  RemoveText(this.item);
  @override
  List<Object?> get props => [item];
}

class IsFavorite extends FavoriteEvent {}
