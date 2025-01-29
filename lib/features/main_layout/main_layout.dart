import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/core/helpers/snackbars.dart';
import 'package:pure_minds/features/cart/view/cart_screen.dart';
import 'package:pure_minds/features/categories/view/screens/category_navigator.dart';
import 'package:pure_minds/features/favorite/view/favorties_screen.dart';
import 'package:pure_minds/features/home/home_screen.dart';
import 'package:pure_minds/features/main_layout/bnb/main_bottom_nav_bar.dart';
import 'package:pure_minds/features/profile/view/profile_Screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, this.initIndex = 0});
  final int initIndex;
  static Function(int i) setIndex = (i) {};
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late ValueNotifier<int> currentIndex;
  late int _prevIdenx;
  final ValueNotifier _canPop = ValueNotifier(false);

  getScreen(int i) {
    switch (i) {
      case 0:
        return const HomeScreen(key: ValueKey(0));
      case 1:
        return const CategoryNavigator(key: ValueKey(1));
      case 2:
        return const CartScreen(key: ValueKey(2));
      case 3:
        return const FavortiesScreen(key: ValueKey(3));
      case 4:
        return const ProfileScreen(key: ValueKey(4));
      default:
        return Container(key: const ValueKey(5), color: Colors.red);
    }
  }

  @override
  void initState() {
    MainLayout.setIndex = (i) {
      Future.delayed(Durations.short3, () => _prevIdenx = currentIndex.value);
      currentIndex.value = i;
    };
    currentIndex = ValueNotifier(widget.initIndex);
    _prevIdenx = currentIndex.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ValueListenableBuilder(
        valueListenable: _canPop,
        builder: (context, value, child) => PopScope(
            canPop: value,
            onPopInvokedWithResult: (didPop, r) {
              if (_canPop.value) exit(0);
              _canPop.value = true;
              AppSnackbar.exitSnack(context);
              Future.delayed(const Duration(seconds: 2)).then((v) => _canPop.value = false);
            },
            child: child!),
        child: Scaffold(
          body: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) => PageTransitionSwitcher(
                duration: Durations.long4,
                reverse: _prevIdenx > value,
                transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                      fillColor: Colors.transparent,
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child);
                },
                layoutBuilder: (children) => SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: children[0],
                    ),
                child: getScreen(value)),
          ),
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) => MainButtomNavBar(
              initIndex: value,
              onPressed: (i) {
                Future.delayed(Durations.short3, () => _prevIdenx = currentIndex.value);
                currentIndex.value = i;
              },
            ),
          ),
        ),
      ),
    );
  }
}
