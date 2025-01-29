import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class ProductTabsWidget extends StatefulWidget {
  const ProductTabsWidget({super.key});

  @override
  State<ProductTabsWidget> createState() => _ProductTabsWidgetState();
}

class _ProductTabsWidgetState extends State<ProductTabsWidget> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: tabController,

          tabs: [
            Tab(text: L10n.tr().description),
            Tab(text: L10n.tr().review),
            Tab(text: L10n.tr().disccusion),
          ],
          padding: EdgeInsets.zero,
          indicatorColor: Co.yellow,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          labelStyle: TStyle.blackBold(17),
          unselectedLabelStyle: TStyle.greySemi(16),
          // labelPadding: EdgeInsets.symmetric(horizontal: 30),
        ),
        VerticalSpacing(20),
        SizedBox(
          height: 150,
          child: TabBarView(
            controller: tabController,
            children: List.generate(
              3,
              (i) {
                return Text(
                  L10n.tr().lorumIpsum + L10n.tr().lorumIpsum,
                  style: TStyle.greySemi(15),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
