import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/session_data.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10n.tr().goodMorning,
          style: TStyle.darkGreyRegular(14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${SessionData.instance.user?.firstName ?? ''} ${SessionData.instance.user?.lastName ?? ''}",
              style: TStyle.blackBold(20),
            ),
            IconButton(
                onPressed: () {},
                icon: const Badge(
                  padding: EdgeInsets.zero,
                  backgroundColor: Co.white,
                  label: CircleAvatar(
                    radius: 6,
                    backgroundColor: Co.yellow,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Co.darkGrey,
                    size: 26,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
