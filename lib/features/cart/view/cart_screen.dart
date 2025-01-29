import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/core/helpers/dialogs.dart';
import 'package:pure_minds/core/resources/assets.dart';
import 'package:pure_minds/features/cart/cubit/cart_cubit.dart';
import 'package:pure_minds/features/cart/cubit/cart_states.dart';
import 'package:pure_minds/features/cart/view/widgets/cart_card.dart';
import 'package:pure_minds/features/general_widgets/main_safe_area.dart';
import 'package:pure_minds/features/general_widgets/no_data_widget.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return MainSafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(L10n.tr().itemDetails),
        titleTextStyle: TStyle.blackSemi(22),
        foregroundColor: Co.black,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () async {},
              child: Text(L10n.tr().placeOrder, style: TStyle.orangeSemi(18)),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) => cubit.cartItems.isEmpty
            ? NoDataWidget(msg: L10n.tr().yourCartIsEmpty, svgImage: Assets.assetsSvgEmptyCart)
            : ListView.separated(
                shrinkWrap: true,
                itemCount: cubit.cartItems.length,
                padding: AppConsts.defaultPadding,
                separatorBuilder: (context, index) => const VerticalSpacing(32),
                itemBuilder: (context, index) {
                  final item = cubit.cartItems[index];
                  return Dismissible(
                      key: Key("${item.id}"),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) => Dialogs.confirmDialog(
                            title: L10n.tr().warning,
                            message: L10n.tr().areyouSureYouWantToDeleteThisItem,
                            okBgColor: Co.red,
                            cancelBgColor: Co.grey,
                          ),
                        );
                      },
                      onDismissed: (direction) {
                        cubit.removeItem(item.id);
                      },
                      dismissThresholds: {
                        DismissDirection.endToStart: 0.4,
                        DismissDirection.startToEnd: 0.4
                      },
                      background: ColoredBox(
                        color: Co.black,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(2, (i) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Icon(CupertinoIcons.delete_solid, color: Co.white, size: 28),
                              );
                            })),
                      ),
                      child: CartCard(item: item));
                },
              ),
      ),
    ));
  }
}
