import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppConsts.defaultHorPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  L10n.tr().categories,
                  style: TStyle.blackBold(18),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded, size: 24)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: AppConsts.defaultHorPadding,
              scrollDirection: Axis.horizontal,
              itemCount: DummyData.categories.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConsts.defaultRadius,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: SvgPicture.asset(
                    DummyData.categories[index].image,
                    height: 60,
                    width: 60,
                    colorFilter: const ColorFilter.mode(Co.purple, BlendMode.srcIn),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
