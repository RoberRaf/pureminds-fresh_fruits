import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/features/general_widgets/main_text_field.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.onSubmitted});
  final Function(String?) onSubmitted;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      controller: controller,
      suffix: IconButton(
          constraints: const BoxConstraints(),
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(40, 40)),
          ),
          onPressed: () => widget.onSubmitted(controller.text),
          icon: const Icon(CupertinoIcons.search, color: Co.midGrey, size: 24)),
      borderColor: Colors.transparent,
      isFilled: true,
      style: TStyle.greySemi(15),
      bgColor: const Color(0xFFF0F0F0),
      borderRadius: 20,
      hintText: L10n.tr().searchHere,
    );
  }
}
