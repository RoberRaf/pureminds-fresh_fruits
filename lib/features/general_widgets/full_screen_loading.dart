import 'package:flutter/material.dart';
import 'package:pure_minds/features/general_widgets/main_progress_indicator.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key, required this.isLoadiong, required this.child});
  final bool isLoadiong;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Stack(
          children: [
            child,
            if (isLoadiong)
              LayoutBuilder(builder: (context, constrains) {
                return const Scaffold(
                  backgroundColor: Colors.black12,
                  body: MainProgressIndicator(),
                );
              })
          ],
        ),
      ),
    );
  }
}
