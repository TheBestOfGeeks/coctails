import 'package:bloc/bloc.dart';
import 'package:coctails/common/variables.dart';
import 'package:coctails/data/coctails_responce/coctails/drink.dart';
import 'package:coctails/domain/main_screen_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/coctails_responce/coctails/coctails.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoriteLoadEvent>(onFavoriteLoadEvent);
  }

  onFavoriteLoadEvent(event, emit) {
    var favoriteDrinks = Variables.drinks;
    emit(FavoritesLoaded(drinks: favoriteDrinks));
  }
}
