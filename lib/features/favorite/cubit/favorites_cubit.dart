import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/features/favorite/cubit/favorite_states.dart';
import 'package:pure_minds/features/product/data/product_model.dart';

class FavoritesCubit extends Cubit<FavoriteStates> {
  FavoritesCubit() : super(FavoriteInitialState());

  final favoritesIDs = <int>{};
  final favorties = <ProductModel>[];

  toggleFavorite(ProductModel product) {
    if (favoritesIDs.contains(product.id)) {
      removeFavorite(product.id);
    } else {
      addfavorite(product);
    }
  }

  bool addfavorite(ProductModel product) {
    if (favoritesIDs.add(product.id)) {
      favorties.add(product);
      emit(FavoritesUpdatedState());
      return true;
    }
    return false;
  }

  bool removeFavorite(int id) {
    if (favoritesIDs.remove(id)) {
      favorties.removeWhere((e) => e.id == id);
      emit(FavoritesUpdatedState());
      return true;
    }
    return false;
  }

  void clearFavorties() {
    favoritesIDs.clear();
    favorties.clear();
    emit(FavoritesUpdatedState());
  }
}
