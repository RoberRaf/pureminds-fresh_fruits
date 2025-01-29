import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/main_layout/bnb/forked_bnb_bubble/bottom_bar/bottom_bar_bubble.dart';
import 'package:pure_minds/features/main_layout/bnb/forked_bnb_bubble/bottom_bar_item.dart';

enum NavBarType { home, search, cart, favorties, profile }

class MainButtomNavBar extends StatelessWidget {
  const MainButtomNavBar({super.key, required this.initIndex, required this.onPressed});
  final int initIndex;
  final Function(int i) onPressed;

  @override
  Widget build(BuildContext context) {
    final itemsTypeToIcon = {
      NavBarType.home: Assets.assetsSvgHome,
      NavBarType.search: Assets.assetsSvgChange,
      NavBarType.cart: Assets.assetsSvgCart,
      NavBarType.favorties: Assets.assetsSvgFavorites,
      NavBarType.profile: Assets.assetsSvgProfile,
    };
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DecoratedBox(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -6),
            ),
          ]),
          child: BottomBarBubble(
            selectedIndex: initIndex,
            color: Co.orange,
            onSelect: (index) {
              onPressed(index);
            },
            items: List.generate(itemsTypeToIcon.length, (index) {
              return BottomBarItem(
                iconBuilder: (color) {
                  final child = SvgPicture.asset(
                    itemsTypeToIcon.values.elementAt(index),
                    height: 24,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  );
                  if (itemsTypeToIcon.keys.elementAt(index) == NavBarType.cart) {
                    return Badge(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(1),
                      label: const CircleAvatar(
                        radius: 6,
                        backgroundColor: Co.yellow,
                      ),
                      child: child,
                    );
                  }
                  return child;
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
