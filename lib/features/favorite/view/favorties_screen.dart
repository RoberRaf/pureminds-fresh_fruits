import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/helpers/dialogs.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/categories/data/category_routes.dart';
import 'package:pure_minds/features/categories/view/widgets/product_grid_card.dart';
import 'package:pure_minds/features/favorite/cubit/favorite_states.dart';
import 'package:pure_minds/features/favorite/cubit/favorites_cubit.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/general_widgets/no_data_widget.dart';
import 'package:pure_minds/features/main_layout/main_layout.dart';

class FavortiesScreen extends StatelessWidget {
  const FavortiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavoritesCubit>(context);
    return MainSafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(L10n.tr().favorties),
        foregroundColor: Co.black,
        centerTitle: true,
        actions: [
          if (cubit.favorties.isNotEmpty)
            IconButton(
              onPressed: () async {
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => Dialogs.confirmDialog(
                    title: L10n.tr().warning,
                    message: L10n.tr().areYouSureYouWantToClearAllItems,
                  ),
                );
                if (result == true) cubit.clearFavorties();
              },
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  CupertinoIcons.delete,
                  size: 24,
                  color: Co.red,
                ),
              ),
            ),
        ],
      ),
      body: BlocBuilder<FavoritesCubit, FavoriteStates>(
        builder: (context, state) => cubit.favorties.isEmpty
            ? NoDataWidget(
                msg: L10n.tr().youHaveNoFavoriteItems, svgImage: Assets.assetsSvgEmptyFavorites)
            : GridView.builder(
                shrinkWrap: true,
                itemCount: cubit.favorties.length,
                padding: AppConsts.defaultPadding,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  childAspectRatio: 1.15 / 1.5,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                ),
                itemBuilder: (context, index) {
                  final product = cubit.favorties[index];
                  return InkWell(
                    onTap: () {
                      MainLayout.setIndex(1);
                      Future.delayed(Durations.extralong1, () {
                        AppConsts.categoryNavigatorKey.currentContext?.myPushNamed(
                          CategoryRoutes.categoryItem,
                          arguments: {"id": product.id},
                        );
                      });
                    },
                    child: ProductGridCard(prod: product),
                  );
                },
              ),
      ),
    ));
  }
}
