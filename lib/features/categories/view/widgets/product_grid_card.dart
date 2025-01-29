import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/services/helpers.dart';
import 'package:pure_minds/features/favorite/view/widgets/favorite_icon.dart';
import 'package:pure_minds/features/product/data/product_model.dart';

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({super.key, required this.prod});

  final ProductModel prod;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppConsts.defaultRadius,
        image: DecorationImage(image: AssetImage(prod.image), fit: BoxFit.cover),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppConsts.defaultRadius,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black26,
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      prod.name,
                      style: TStyle.whiteBold(20),
                    ),
                    Text(
                      Helpers.getProperPrice(prod.price),
                      style: TStyle.whiteBold(16),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: L10n.isAr(context) ? null : 12,
              right: L10n.isAr(context) ? 12 : null,
              child: FavoriteIcon(prod: prod),
            )
          ],
        ),
      ),
    );
  }
}
