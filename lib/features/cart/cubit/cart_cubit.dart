import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/features/cart/cubit/cart_states.dart';
import 'package:pure_minds/features/cart/data/cart_item_mode.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());
  final cartItems = <CartItemModel>[];
  final cartItemsIds = <int>{};

  void updateCartItem(CartItemModel item) {
    if (cartItemsIds.contains(item.id)) {
      _updateExistingCartItem(item);
    } else {
      _addNewItem(item);
    }
  }

  _updateExistingCartItem(CartItemModel item) {
    final index = cartItems.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      cartItems[index].quantity += item.quantity;
      emit(CartItemsUpdatedState());
    }
  }

  _addNewItem(CartItemModel item) {
    cartItems.add(item);
    cartItemsIds.add(item.id);
    emit(CartItemsUpdatedState());
  }

  incrementItemQuantity(int id, isAdding) {
    final index = cartItems.indexWhere((e) => e.id == id);
    if (index != -1) {
      if (isAdding) {
        cartItems[index].quantity++;
      } else {
        cartItems[index].quantity--;
      }
      emit(CartItemsUpdatedState());
    }
  }

  void clearCart() {
    cartItems.clear();
    cartItemsIds.clear();
    emit(CartItemsUpdatedState());
  }

  void removeItem(int id) {
    final index = cartItems.indexWhere((e) => e.id == id);
    if (index != -1) {
      cartItems.removeAt(index);
      cartItemsIds.remove(id);
      emit(CartItemsUpdatedState());
    }
  }

  double calculateAllCartItemsPrice() {
    return cartItems.fold(0, (previousValue, element) {
      return previousValue + element.totalPrice;
    });
  }
}
