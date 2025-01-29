import 'package:flutter/material.dart';
import 'package:pure_minds/config/theming/theming.dart';

class IncrementWidget extends StatelessWidget {
  const IncrementWidget(
      {super.key,
      required this.onIncrement,
      required this.onDecrement,
      required this.value,
      this.isHorizontal = true});
  final Function() onIncrement;
  final Function() onDecrement;
  final int value;
  final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    final children = [
      IconButton(
        onPressed: () => onDecrement(),
        icon: const Icon(
          Icons.remove,
          color: Co.yellow,
          size: 30,
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 20),
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
            style: TStyle.blackRegular(18),
            key: ValueKey(value),
          ),
        ),
      ),
      IconButton(
          onPressed: () => onIncrement(),
          icon: const Icon(
            Icons.add,
            color: Co.yellow,
            size: 30,
          )),
    ];
    return isHorizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
  }
}
