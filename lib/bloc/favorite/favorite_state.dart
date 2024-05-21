import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  final List<String> favoriteItem;
  final bool isFavorite;
  const FavoriteState({this.favoriteItem = const [], this.isFavorite = false});
  FavoriteState copyWith({List<String>? favoriteItem, bool? isFavorite}) {
    return FavoriteState(
        favoriteItem: favoriteItem ?? this.favoriteItem,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favoriteItem, isFavorite];
}
