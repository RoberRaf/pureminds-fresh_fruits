import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/core/helpers/alerts.dart';
import 'package:pure_minds/core/services/helpers.dart';
import 'package:pure_minds/features/favorite/cubit/favorite_states.dart';
import 'package:pure_minds/features/favorite/cubit/favorites_cubit.dart';
import 'package:pure_minds/features/favorite/view/widgets/favorite_icon.dart';
import 'package:pure_minds/features/product/cubit/product_cubit.dart';
import 'package:pure_minds/features/product/cubit/product_states.dart';

class ProductFooterBtns extends StatelessWidget {
  const ProductFooterBtns({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();
    final favoriteCubit = context.read<FavoritesCubit>();
    return ColoredBox(
      color: Co.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 8, 32, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
                height: 70,
                onPressed: () => favoriteCubit.toggleFavorite(cubit.product),
                minWidth: 100,
                color: Co.green,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: BlocBuilder<FavoritesCubit, FavoriteStates>(
                  builder: (context, state) => FavoriteIcon(
                    prod: cubit.product,
                    isFav: favoriteCubit.favoritesIDs.contains(cubit.product.id),
                  ),
                )),
            MaterialButton(
              height: 70,
              onPressed: () => cubit.addCartItem(),
              minWidth: 200,
              color: Co.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Text(
                    L10n.tr().addToCart.toUpperCase(),
                    style: TStyle.blackBold(14),
                  ),
                  BlocConsumer<ProductCubit, ProductStates>(
                    listener: (context, state) {
                      if (state is AddedCartITemSuccessState) {
                        Alerts.showToast(L10n.tr().itemAddedToCartSuccesfully, error: false);
                      }
                    },
                    buildWhen: (previous, current) => current is QuantityUpdateState,
                    builder: (context, state) => AnimatedSwitcher(
                      duration: Durations.medium1,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Text(
                        Helpers.getProperPrice(cubit.product.price * cubit.quantity),
                        key: ValueKey(cubit.quantity),
                        style: TStyle.blackBold(14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
