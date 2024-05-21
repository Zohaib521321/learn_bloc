import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/favorite/favorite_state.dart';

import 'favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<Remove>(_remove);
    on<Add>(_add);
    on<RemoveText>(_removeText);
  }
  void _remove(Remove event, Emitter<FavoriteState> emit) {
    final updatedList = List<String>.from(state.favoriteItem);
    updatedList.removeAt(event.index);

    emit(state.copyWith(favoriteItem: updatedList, isFavorite: false));
  }

  void _removeText(RemoveText event, Emitter<FavoriteState> emit) {
    final updatedList = List<String>.from(state.favoriteItem);
    updatedList.removeWhere((element) => element == event.item);
    emit(state.copyWith(favoriteItem: updatedList, isFavorite: false));
  }

  void _add(Add event, Emitter<FavoriteState> emit) {
    final updatedList = List<String>.from(state.favoriteItem);
    updatedList.add(event.item);

    emit(state.copyWith(favoriteItem: updatedList, isFavorite: true));
  }
}
