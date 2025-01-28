import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/di.dart';
import 'package:pure_minds/features/categories/data/category_routes.dart';
import 'package:pure_minds/features/categories/view/screens/catecory_screen.dart';
import 'package:pure_minds/features/categories/view/screens/categories_screen.dart';
import 'package:pure_minds/features/product/cubit/product_cubit.dart';
import 'package:pure_minds/features/product/view/product_screen.dart';

class CatecoryNavigator extends StatelessWidget {
  const CatecoryNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: AppConsts.categoryNavigatorKey,
      initialRoute: CategoryRoutes.categories,
      onGenerateRoute: (settings) {
        final argumanets = settings.arguments as Map<String, dynamic>?;
        switch (settings.name) {
          case CategoryRoutes.categories:
            return platformPageRoute(const CategoriesScreen(), settings);
          case CategoryRoutes.category:
            return platformPageRoute(CategoryScreen(catId: argumanets?['catId']), settings);
          case CategoryRoutes.categoryItem:
            return platformPageRoute(
                BlocProvider(
                  create: (context) => di<ProductCubit>(param1: argumanets?['id']),
                  child: ProductScreen(catId: argumanets?['catId']),
                ),
                settings);
          default:
            return platformPageRoute(const SizedBox.shrink(), settings);
        }
      },
    );
  }

  Route platformPageRoute(Widget screen, RouteSettings settings) {
    return Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => screen, settings: settings)
        : CupertinoPageRoute(builder: (_) => screen, settings: settings);
  }
}
