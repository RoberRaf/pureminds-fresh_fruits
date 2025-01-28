import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/core/services/helpers.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';

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
            childAspectRatio: 1 / 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = DummyData.products[index];
            return InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: AppConsts.defaultRadius,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(child: SizedBox.shrink()),
                      Flexible(
                        // flex: 5,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Padding(
                              padding: AppConsts.defaultPadding,
                              child: SizedBox(
                                width: double.infinity,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: product.name),
                                      const TextSpan(text: '\n'),
                                      TextSpan(
                                        text: Helpers.getProperPrice(product.price),
                                        style: TStyle.whiteBold(16),
                                      ),
                                    ],
                                  ),
                                  style: TStyle.whiteBold(17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        MainButton(
          margin: AppConsts.defaultPadding,
          bgColor: Co.black,
          style: TStyle.whiteBold(16),
          text: L10n.tr().more,
          ontap: () {},
        ),
      ],
    );
  }
}
