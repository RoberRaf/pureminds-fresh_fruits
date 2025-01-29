import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.msg, this.color, required this.svgImage});
  final String msg;
  final Color? color;
  final String svgImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.defaultPadding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(svgImage,
                height: 170,
                fit: BoxFit.fitHeight,
                colorFilter: const ColorFilter.mode(Co.grey, BlendMode.srcIn)),
            const VerticalSpacing(20),
            Text(
              msg,
              style: TStyle.greyBold(20).copyWith(color: color),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
