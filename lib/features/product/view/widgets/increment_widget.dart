import 'package:flutter/material.dart';
import 'package:pure_minds/config/theming/theming.dart';

class IncrementWidget extends StatelessWidget {
  const IncrementWidget(
      {super.key,
      required this.onIncrement,
      required this.onDecrement,
      required this.value,
      this.useSecondaryColors = false,
      this.isHorizontal = true});
  final Function() onIncrement;
  final Function() onDecrement;
  final int value;
  final bool isHorizontal;
  final bool useSecondaryColors;
  @override
  Widget build(BuildContext context) {
    final children = [
      IconButton(
        onPressed: () => onDecrement(),
        padding: EdgeInsets.all(4),
        icon: Icon(
          Icons.remove,
          color: useSecondaryColors ? Co.midGrey : Co.yellow,
          size: 26,
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 35),
        child: AnimatedSwitcher(
          duration: Durations.medium1,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: TStyle.blackRegular(17),
            key: ValueKey(value),
          ),
        ),
      ),
      IconButton(
          onPressed: () => onIncrement(),
          padding: EdgeInsets.all(4),
          icon: Icon(
            Icons.add,
            color: useSecondaryColors ? Co.midGrey : Co.yellow,
            size: 26,
          )),
    ];
    return isHorizontal
        ? DecoratedBox(
            decoration: BoxDecoration(
              color: !useSecondaryColors ? Co.lightGrey : Color(0xFFEFEFEF),
              borderRadius: AppConsts.defaultRadius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
  }
}
