import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/features/cart/cubit/cart_states.dart';
import 'package:pure_minds/features/cart/data/cart_item_mode.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());
  final cartItems = <CartItemMode>[];
  void removeCartItem(int id) {}

  void updateCartItem(int id, int quantity) {}
}
