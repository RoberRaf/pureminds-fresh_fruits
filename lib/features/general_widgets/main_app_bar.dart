// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tabali/config/theming/theming.dart';
// import 'package:tabali/core/extensions/context.dart';
// import 'package:tabali/core/resources/assets.dart';
// import 'package:tabali/core/services/helpers.dart';
// import 'package:tabali/features/profile/profile_screen.dart';

// class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool showBack;
//   final bool showProfile;
//   final bool showLogo;
//   final bool showDrawer;
//   final VoidCallback? onBack;
//   final VoidCallback? onDrawer;
//   // final VoidCallback? onSearch;
//   final String? title;
//   final TextStyle? style;
//   final bool showShadow;
//   const MainAppBar({
//     this.showProfile = false,
//     this.title,
//     this.onBack,
//     super.key,
//     this.showLogo = false,
//     this.style,
//     this.showBack = true,
//     this.showDrawer = false,
//     // this.onSearch,
//     this.onDrawer,
//     this.showShadow = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: preferredSize.height,
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border(bottom: BorderSide(color: showShadow ? Colors.black12 : Colors.transparent, width: 0.5)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (showProfile)
//                 MaterialButton(
//                   onPressed: !showProfile
//                       ? null
//                       : () {
//                           if (!Helpers.requestLogin(context)) context.myPush(const EditProfileScreen());
//                         }, // context.myPop(),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//                   color: showProfile ? Co.primary : Colors.transparent,
//                   elevation: showProfile ? 0 : null,
//                   minWidth: 0,
//                   padding: EdgeInsets.all(10.r),
//                   child: SvgPicture.asset(Assets.assetsSvgProfile,
//                       colorFilter: ColorFilter.mode(showProfile ? Co.white : Colors.transparent, BlendMode.srcIn),
//                       width: 20.r,
//                       height: 20.r),

//                   //  Icon(Icons.person, color: showSearch ? Co.white : Colors.transparent, size: 20.r),
//                 )
//               else
//                 MaterialButton(
//                   onPressed: !showBack ? null : onBack ?? () => context.myPop(),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//                   color: showBack ? Co.white : Colors.transparent,
//                   elevation: showBack ? 0 : null,
//                   minWidth: 0,
//                   padding: EdgeInsets.all(12.r),
//                   child: Icon(Icons.arrow_back_ios_new, color: showBack ? Co.black : Colors.transparent, size: 16.r),
//                 ),
//               if (title != null && !showLogo)
//                 Text(
//                   title!,
//                   style: TStyle.blackSemi(18),
//                 ),
//               if (showLogo) Image.asset(Assets.assetsPngCroppedLogo, fit: BoxFit.fitHeight),
//               // if (showDrawer)
//               MaterialButton(
//                   onPressed: !showDrawer
//                       ? null
//                       : onDrawer ??
//                           () {
//                             Scaffold.of(context).openEndDrawer();
//                           },
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//                   color: showDrawer ? Co.primary : Colors.transparent,
//                   minWidth: 0,
//                   padding: EdgeInsets.all(8.r),
//                   child: Image.asset(Assets.assetsPngCategory, color: !showDrawer ? Colors.transparent : null, height: 24.r, width: 24.r))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(Helpers.getProperSize(60));
// }
