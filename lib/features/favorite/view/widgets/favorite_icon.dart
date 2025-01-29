import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/features/favorite/cubit/favorites_cubit.dart';
import 'package:pure_minds/features/product/data/product_model.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key, required this.prod});
  final ProductModel prod;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late bool isFav;
  late final FavoritesCubit cubit;
  @override
  void initState() {
    cubit = context.read<FavoritesCubit>();

    isFav = context.read<FavoritesCubit>().favoritesIDs.contains(widget.prod.id);
    controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 1, end: 1.25).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isFav ? cubit.removeFavorite(widget.prod.id) : cubit.addfavorite(widget.prod)) {
          {
            controller.forward().then((_) {
              setState(() => isFav = !isFav);
              controller.reverse();
              controller.forward();
              controller.reverse();
            });
          }
        }
      },
      icon: ScaleTransition(
        scale: animation,
        child: Icon(
          Icons.favorite,
          color: isFav ? Co.red : Co.white,
          size: 24,
        ),
      ),
    );
  }
}
