import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/features/categories/data/category_routes.dart';
import 'package:pure_minds/features/categories/view/widgets/product_grid_card.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';
import 'package:pure_minds/features/main_layout/main_layout.dart';

class TrendingDealsWidget extends StatelessWidget {
  const TrendingDealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppConsts.defaultPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                L10n.tr().trendingDeals,
                style: TStyle.blackBold(18),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded, size: 24)),
            ],
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          padding: AppConsts.defaultHorPadding,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            childAspectRatio: 1.15 / 1.5,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (context, index) {
            final product = DummyData.products[index];
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
        MainButton(
          margin: AppConsts.defaultPadding,
          bgColor: Co.black,
          style: TStyle.whiteBold(16),
          text: L10n.tr().more,
          ontap: () {
            MainLayout.setIndex(1);
          },
        ),
      ],
    );
  }
}
