import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/features/categories/data/category_routes.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainSafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          L10n.tr().categories,
          style: TStyle.blackBold(18),
        ),
      ),
      body: GridView.builder(
        padding: AppConsts.defaultPadding,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: DummyData.categories.length,
        itemBuilder: (context, index) {
          final cat = DummyData.categories[index];
          return MaterialButton(
            // splashColor: Co.yellow,
            highlightColor: Co.yellow,
            color: Co.white,
            onPressed: () {
              AppConsts.categoryNavigatorKey.currentContext?.myPushNamed(
                CategoryRoutes.category,
                arguments: {'catId': cat.id},
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: AppConsts.defaultRadius,
            ),
            padding: const EdgeInsets.all(10),
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalSpacing(15),
                SvgPicture.asset(
                  cat.image,
                  height: 75,
                  width: 75,
                  fit: BoxFit.contain,
                ),
                const VerticalSpacing(15),
                Text(
                  cat.title,
                  style: TStyle.orangeBolder(20),
                ),
                Text("${cat.itemsCount} ${L10n.tr().items}", style: TStyle.orangeBold(14)),
              ],
            ),
          );
        },
      ),
    ));
  }
}
