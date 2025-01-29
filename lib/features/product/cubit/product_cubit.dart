import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/features/cart/cubit/cart_cubit.dart';
import 'package:pure_minds/features/cart/data/cart_item_mode.dart';
import 'package:pure_minds/features/product/cubit/product_states.dart';
import 'package:pure_minds/features/product/data/product_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  late final ProductModel product;
  int quantity = 1;
  ProductCubit(int id) : super(ProductInitialState()) {
    product = DummyData.products.firstWhere((e) => e.id == id);
  }

  void updateQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity++;
    } else {
      if (quantity <= 1) return;
      quantity--;
    }
    emit(QuantityUpdateState());
  }

  void addCartItem() {
    final context = AppConsts.navigatorKey.currentContext;
    context?.read<CartCubit>().updateCartItem(CartItemModel(quantity: quantity, prod: product));
    emit(AddedCartITemSuccessState());
  }

  void updateCartItem() {
    emit(UpdatedCartItemSuccessState());
  }
}
