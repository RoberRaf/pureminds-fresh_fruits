import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/main_layout/bottom_bar_buble.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, this.initIndex = 0});
  final int initIndex;
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late ValueNotifier<int> currentIndex;
  late int _prevIdenx;
  @override
  void initState() {
    currentIndex = ValueNotifier(widget.initIndex);
    _prevIdenx = currentIndex.value;
    super.initState();
  }

  getScreen(int i) {
    switch (i) {
      case 0:
        return Container(key: const ValueKey(0), color: Colors.red);
      case 1:
        return Container(key: const ValueKey(1), color: Colors.blue);
      case 2:
        return Container(key: const ValueKey(2), color: Colors.green);
      case 3:
        return Container(key: const ValueKey(3), color: Colors.yellow);
      case 4:
        return Container(key: const ValueKey(4), color: Colors.purple);
      default:
        return Container(key: const ValueKey(5), color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainSafeArea(
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
        bottomNavigationBar: BottomBarBuble(
          initIndex: currentIndex.value,
          onPressed: (i) {
            _prevIdenx = currentIndex.value;
            currentIndex.value = i;
          },
        ),
      ),
    );
  }
}
