import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/features/categories/data/category_routes.dart';
import 'package:pure_minds/features/categories/view/widgets/custom_search_bar.dart';
import 'package:pure_minds/features/categories/view/widgets/product_grid_card.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.catId});
  final int catId;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final prods = List.from(DummyData.products);

  Timer? _debounce;

  void _onSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      prods.clear();
      if (value.isEmpty) {
        setState(() => prods.addAll(DummyData.products));
        return;
      }
      setState(() {
        prods.addAll(
            DummyData.products.where((e) => e.name.toLowerCase().contains(value.toLowerCase())));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final caregory = DummyData.categories.firstWhere((e) => e.id == widget.catId);
    return MainSafeArea(
        color: Co.yellow,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            foregroundColor: Co.white,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.assetsSvgControl,
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: AppConsts.defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      caregory.title,
                      style: TStyle.blackBold(22),
                    ),
                    Text(
                      "${caregory.itemsCount} ${L10n.tr().items}",
                      style: TStyle.blackSemi(16),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Co.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(28, 28, 28, 5),
                        child: CustomSearchBar(
                          onSubmitted: (v) {
                            _onSearch(v ?? '');
                          },
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: prods.length,
                          padding: AppConsts.defaultPadding,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) {
                            final prod = prods[index];
                            return InkWell(
                                onTap: () {
                                  AppConsts.categoryNavigatorKey.currentState?.pushNamed(
                                      CategoryRoutes.categoryItem,
                                      arguments: {'id': prod.id, 'catId': widget.catId});
                                },
                                child: ProductGridCard(prod: prod));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
