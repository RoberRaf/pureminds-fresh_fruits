import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/core/resources/dummy_data.dart';
import 'package:pure_minds/core/services/helpers.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';
import 'package:pure_minds/features/product/cubit/product_cubit.dart';
import 'package:pure_minds/features/product/cubit/product_states.dart';
import 'package:pure_minds/features/product/view/widgets/increment_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.catId});
  final int catId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final String catTitle;
  final controller = PageController();

  Timer? timer;
  late final ProductCubit cubit;
  @override
  void initState() {
    cubit = context.read<ProductCubit>();
    catTitle = DummyData.categories.firstWhere((e) => e.id == widget.catId).title;
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (controller.page == 2) {
        controller.animateTo(duration: Durations.long2, curve: Curves.easeIn, 0);
      } else {
        controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _BackGroundImage(
          controller: controller,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Co.white,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined, size: 32),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              VerticalSpacing(260 - MediaQuery.paddingOf(context).top),
              Expanded(
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: DummyData.onBoardings.length,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          height: 6,
                          width: 23,
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        activeDotDecoration: DotDecoration(
                          height: 6,
                          width: 23,
                          color: Co.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const VerticalSpacing(15),
                    Expanded(
                      child: DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Co.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: SingleChildScrollView(
                            padding: AppConsts.defaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  catTitle.toUpperCase(),
                                  style: TStyle.blackSemi(15),
                                ),
                                Text(
                                  cubit.product.name,
                                  style: TStyle.blackBold(20),
                                ),
                                BlocBuilder<ProductCubit, ProductStates>(
                                  buildWhen: (previous, current) => current is QuantityUpdateState,
                                  builder: (context, state) => Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AnimatedSwitcher(
                                        duration: Durations.medium1,
                                        transitionBuilder:
                                            (Widget child, Animation<double> animation) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                        child: Text(
                                          Helpers.getProperPrice(
                                              cubit.product.price * cubit.quantity),
                                          key: ValueKey(cubit.quantity),
                                          style: TStyle.yellowSemi(22),
                                        ),
                                      ),
                                      IncrementWidget(
                                        onDecrement: () => cubit.updateQuantity(false),
                                        onIncrement: () => cubit.updateQuantity(true),
                                        value: cubit.quantity,
                                      )
                                    ],
                                  ),
                                ),
                                const HorizontalSpacing(450),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _BackGroundImage extends StatelessWidget {
  const _BackGroundImage({
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: MediaQuery.sizeOf(context).width,
      child: PageView.builder(
        physics: const ClampingScrollPhysics(),
        controller: controller,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black45,
                Colors.transparent,
              ],
            )),
            child: Image.asset(
              Assets.assetsPngProductImage,
              fit: BoxFit.fitHeight,
            ),
          );
        },
      ),
    );
  }
}
