import 'package:flutter/material.dart';
import 'package:pure_minds/config/theming/app_colors.dart';

class ImagesStackedWidget extends StatelessWidget {
  const ImagesStackedWidget({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: (images.length * 40) + 30,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          for (var i = 0; i < images.length; i++)
            Positioned(
              left: i * 40,
              child: CircleAvatar(
                radius: 29,
                backgroundColor: Co.white,
                child: CircleAvatar(
                  backgroundImage: AssetImage(images[i]),
                  radius: 26,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
