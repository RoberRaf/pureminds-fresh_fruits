import 'package:flutter/material.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class CustomRadioListtile extends StatelessWidget {
  const CustomRadioListtile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected,
      this.firstSubtitle,
      this.secSubtitle});
  final String title;
  final String? firstSubtitle;
  final String? secSubtitle;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Co.white,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: AppConsts.defaultRadius,
        side: BorderSide(
            color: isSelected ? Co.yellow : Colors.transparent, width: 1),
      ),
      child: InkWell(
        onTap: onTap == null ? null : () => onTap!(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(title, style: TStyle.blackBold(15))),
              Flexible(
                child: Row(
                  children: [
                    if (firstSubtitle != null)
                      Expanded(
                        child: Text(
                          firstSubtitle!,
                          style: TStyle.greySemi(14),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ...[
                      const HorizontalSpacing(12),
                      if (secSubtitle != null)
                        Expanded(
                          child: Text(
                            secSubtitle ?? '',
                            textAlign: TextAlign.start,
                            style: TStyle.greySemi(12).copyWith(
                                decoration: TextDecoration.lineThrough),
                          ),
                        )
                    ]
                  ],
                ),
              ),
              if (onTap != null)
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Co.orange, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: AnimatedScale(
                      scale: isSelected ? 1 : 0,
                      duration: Durations.short4,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor:
                            isSelected ? Co.orange : Colors.transparent,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
