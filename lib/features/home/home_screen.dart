import 'package:flutter/material.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/home/widgets/home_categories_widget.dart';
import 'package:pure_minds/features/home/widgets/home_header_widget.dart';
import 'package:pure_minds/features/home/widgets/home_slider_widget.dart';
import 'package:pure_minds/features/home/widgets/trending_deals_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainSafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppConsts.defaultPadding,
              child: const HomeHeaderWidget(),
            ),
            const HomeSliderWidget(),
            const VerticalSpacing(30),
            const HomeCategoriesWidget(),
            const TrendingDealsWidget(),
          ],
        ),
      ),
    ));
  }
}
