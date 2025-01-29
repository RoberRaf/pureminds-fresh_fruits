import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/services/helpers.dart';
import 'package:pure_minds/di.dart';
import 'package:pure_minds/features/categories/data/category_routes.dart';
import 'package:pure_minds/features/categories/view/screens/categories_screen.dart';
import 'package:pure_minds/features/categories/view/screens/category_screen.dart';
import 'package:pure_minds/features/product/cubit/product_cubit.dart';
import 'package:pure_minds/features/product/view/product_screen.dart';

class CategoryNavigator extends StatelessWidget {
  const CategoryNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: AppConsts.categoryNavigatorKey,
      initialRoute: CategoryRoutes.categories,
      onGenerateRoute: (settings) {
        final argumanets = settings.arguments as Map<String, dynamic>?;
        switch (settings.name) {
          case CategoryRoutes.categories:
            return Helpers.platformPageRoute(const CategoriesScreen(), settings);
          case CategoryRoutes.category:
            return Helpers.platformPageRoute(CategoryScreen(catId: argumanets?['catId']), settings);
          case CategoryRoutes.categoryItem:
            return Helpers.platformPageRoute(
                BlocProvider(
                  create: (context) => di<ProductCubit>(param1: argumanets?['id']),
                  child: ProductScreen(catId: argumanets?['catId']),
                ),
                settings);
          default:
            return Helpers.platformPageRoute(const SizedBox.shrink(), settings);
        }
      },
    );
  }
}
