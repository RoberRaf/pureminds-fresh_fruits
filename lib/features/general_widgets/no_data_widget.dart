// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tabali/config/localization/l10n/l10n.dart';
// import 'package:tabali/config/theming/theming.dart';
// import 'package:tabali/core/resources/assets.dart';
// import 'package:tabali/features/general_widgets/spacing.dart';

// class NoDataWidget extends StatelessWidget {
//   const NoDataWidget({super.key, this.msg, this.color, this.svgImage});
//   final String? msg;
//   final Color? color;
//   final String? svgImage;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: AppConsts.defaultPadding,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(svgImage ?? Assets.assetsSvgEmptyDrawer,
//                 height: 170.h, fit: BoxFit.fitHeight, colorFilter: const ColorFilter.mode(Co.grey, BlendMode.srcIn)),
//             const VerticalSpacing(20),
//             Text(
//               msg ?? L10n.tr().noData,
//               style: TStyle.greyBold(20).copyWith(color: color),
//               textAlign: TextAlign.center,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
