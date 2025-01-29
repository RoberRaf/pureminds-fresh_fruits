import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/features/favorite/cubit/favorite_states.dart';
import 'package:pure_minds/features/product/data/product_model.dart';

class FavoritesCubit extends Cubit<FavoriteStates> {
  FavoritesCubit() : super(FavoriteInitialState());

  final favoritesIDs = <int>{};
  final favorties = <ProductModel>[];

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
}
