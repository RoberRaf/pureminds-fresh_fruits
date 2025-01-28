import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(DummyData.homeCarousals.length, (i) {
        return Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: AppConsts.defaultRadius,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(DummyData.homeCarousals[i].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Padding(
                              padding: AppConsts.defaultPadding,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    DummyData.homeCarousals[i].title,
                                    style: TStyle.whiteBold(16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Flexible(child: SizedBox.shrink()),
                    ],
                  ),
                ),
              ),
            ),
            const HorizontalSpacing(30),
          ],
        );
      }),
      options: CarouselOptions(
        height: 200,
        disableCenter: true,
        viewportFraction: 0.9,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
