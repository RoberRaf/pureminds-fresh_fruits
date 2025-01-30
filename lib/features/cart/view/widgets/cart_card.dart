import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/services/helpers.dart';
import 'package:pure_minds/features/cart/cubit/cart_cubit.dart';
import 'package:pure_minds/features/cart/data/cart_item_mode.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/product/view/widgets/increment_widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.item});
  final CartItemModel item;
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                borderRadius: AppConsts.defaultRadius,
                child: Image.asset(
                  item.image,
                  width: 100,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Co.yellow,
                    borderRadius: AppConsts.defaultRadius,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 38,
                      minWidth: 100,
                    ),
                    child: Center(
                      child: Text(
                        Helpers.getProperPrice(item.price),
                        style: TStyle.blackSemi(14),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          HorizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.catName, style: TStyle.greySemi(13)),
                Text(item.name, style: TStyle.blackSemi(17)),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedSwitcher(
                      duration: Durations.medium1,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Text(
                        Helpers.getProperPrice(item.totalPrice),
                        key: ValueKey(item.totalPrice),
                        style: TStyle.orangeSemi(16),
                      ),
                    ),
                    IncrementWidget(
                      onIncrement: () => cartCubit.incrementItemQuantity(item.id, true),
                      onDecrement: () => cartCubit.incrementItemQuantity(item.id, false),
                      value: item.quantity,
                      useSecondaryColors: true,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
