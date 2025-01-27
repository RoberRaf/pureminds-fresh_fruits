// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class TextFieldWithSelectedMenut extends StatelessWidget {
//   const TextFieldWithSelectedMenut({
//     super.key,
//     required this.header,
//     this.displaySearch = true,
//     this.isLoading = false,
//     this.buttonTxt,
//     this.initialSelectedValues,
//     this.items,
//     this.onSubmit,
//     this.fillColor,
//     this.searchInputBGColor,
//     this.textStyle,
//     this.borderColor,
//     this.validator,
//     this.widget,
//   });
//   final TextStyle? textStyle;
//   final String? header;

//   final String? buttonTxt;
//   final List<OptionItem>? items;
//   final OptionItem? initialSelectedValues;
//   final Widget? widget;

//   final Function(Set<OptionItem>)? onSubmit;
//   final String? Function(String?)? validator;
//   final bool displaySearch;
//   final Color? searchInputBGColor;
//   final Color? fillColor;
//   final Color? borderColor;
//   final bool isLoading;

//   @override
//   Widget build(BuildContext context) {
//     // final isEmpty = isLoading || items?.isNotEmpty != true;
//     // final controller =
//     //     TextEditingController(text: isEmpty ? header : initialSelectedValues?.title ?? header);
//     final controller = TextEditingController(text: initialSelectedValues?.title);
//     return InkWell(
//         onTap: items?.isNotEmpty != true || isLoading
//             ? null
//             : () {
//                 showDialog(
//                     context: context,
//                     builder: (context) => SelectMenu(
//                           initialSelectedValues: initialSelectedValues,
//                           items: items,
//                           header: header,
//                           buttonTxt: buttonTxt,
//                           widget: widget,
//                           displaySearch: displaySearch,
//                           searchInputBGColor: searchInputBGColor,
//                           onSubmit: (v) {
//                             controller.text = v.first.title;
//                             if (onSubmit != null) onSubmit!(v);
//                           },
//                         ));
//               },
//         child: MainTextField(
//           controller: controller,
//           label: header,
//           suffix: isLoading
//               ? LayoutBuilder(builder: (context, constrains) {
//                   return SizedBox(
//                     height: constrains.minHeight,
//                     width: constrains.minHeight,
//                     child: Center(
//                         child: Platform.isAndroid
//                             ? const CircularProgressIndicator(color: Co.primary)
//                             : const CupertinoActivityIndicator(color: Co.primary)),
//                   );
//                 })
//               : Icon(
//                   Icons.arrow_drop_down_outlined,
//                   color: items?.isNotEmpty == true ? Co.black : Colors.grey,
//                 ),
//           style: TStyle.blackSemi(14).copyWith(color: items?.isNotEmpty == true ? null : Colors.grey),
//           bgColor: fillColor ?? Co.lightTeal,
//           enabled: false,
//           validator: validator,
//         ));
//   }
// }

// class OptionItem {
//   final int id;
//   final String title;
//   const OptionItem({required this.id, required this.title});
// }

// class SelectMenu extends StatefulWidget {
//   const SelectMenu({
//     super.key,
//     required this.header,
//     this.items,
//     this.buttonTxt,
//     this.initialSelectedValues,
//     this.onSubmit,
//     // this.onChange,
//     this.searchInputBGColor,
//     this.widget,
//     this.displaySearch = true,
//   });

//   final String? header;

//   final String? buttonTxt;
//   final List<OptionItem>? items;
//   final OptionItem? initialSelectedValues;
//   final Widget? widget;
//   final Function(Set<OptionItem>)? onSubmit;
//   final bool displaySearch;
//   final Color? searchInputBGColor;

//   @override
//   State<StatefulWidget> createState() => _SelectMenuState();
// }

// class _SelectMenuState extends State<SelectMenu> {
//   final Set<OptionItem> _selectedValues = {};
//   bool isFoled = true;
//   final TextEditingController searchText = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.initialSelectedValues != null) {
//       _selectedValues.add(widget.initialSelectedValues!);
//     }

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       FocusScope.of(context).unfocus();
//     });
//   }

//   void _onItemCheckedChange(OptionItem itemValue, bool checked) {
//     if (mounted) {
//       setState(() {
//         if (checked) {
//           _selectedValues.clear();
//           _selectedValues.add(itemValue);
//         } else {
//           _selectedValues.remove(itemValue);
//         }
//       });
//     }
//   }

//   void _onSubmitTap() {
//     widget.onSubmit!(_selectedValues);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Co.white,
//       clipBehavior: Clip.hardEdge,
//       insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxHeight: MediaQuery.sizeOf(context).height * 0.7,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ColoredBox(
//               color: Co.secondry,
//               child: Padding(
//                 padding: EdgeInsets.all(10.r),
//                 child: widget.displaySearch
//                     ? TextFormField(
//                         autofocus: false,
//                         controller: searchText,
//                         onChanged: (value) => setState(() {}),
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: widget.searchInputBGColor ?? Colors.grey.shade200,
//                           contentPadding: EdgeInsets.all(10.w),
//                           isDense: true,
//                           hintText: widget.header,
//                           hintStyle: TStyle.blackRegular(16),
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.h)),
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               FocusScope.of(context).unfocus();
//                               context.myPop();
//                               searchText.value = TextEditingValue.empty;
//                             },
//                             child: Icon(Icons.close, size: 25.h),
//                           ),
//                         ),
//                       )
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(width: 25.h),
//                           Text(widget.header!, style: TStyle.whiteBold(19), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
//                           IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: Colors.white, size: 25.h)),
//                         ],
//                       ),
//               ),
//             ),
//             if (widget.widget != null) widget.widget!,
//             if (widget.items!.isEmpty)
//               Center(
//                 child: Text(
//                   L10n.tr().noData,
//                   style: TStyle.secondryBold(19),
//                 ),
//               ),
//             if (widget.items!.isNotEmpty)
//               Scrollbar(
//                 trackVisibility: true,
//                 child: ListView.builder(
//                   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//                   shrinkWrap: true,
//                   itemCount: widget.items!.length,
//                   itemBuilder: (context, index) => _buildItem(widget.items![index]),
//                   addRepaintBoundaries: false,
//                 ),
//               ),
//             if (widget.items!.isNotEmpty)
//               MainButton(
//                 bgColor: Co.primary,
//                 margin: EdgeInsets.symmetric(horizontal: 30.w),
//                 text: widget.buttonTxt ?? L10n.tr().submit,
//                 enable: true,
//                 ontap: () {
//                   if (_selectedValues.isEmpty) return;
//                   _onSubmitTap();
//                   Navigator.pop(context);
//                 },
//               ),
//             SizedBox(height: 20.h),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildItem(OptionItem item) {
//     final checked = _selectedValues.any(
//       (e) => e.id == item.id,
//     );
//     return item.title.toLowerCase().contains(searchText.value.text.toLowerCase())
//         ? Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               GestureDetector(
//                 onTap: () => _onItemCheckedChange(item, !checked),
//                 child: _CheckBoxWithTitle(
//                   value: checked,
//                   widget: Text(item.title, style: checked ? TStyle.secondryBold(14) : TStyle.blackSemi(14)),
//                   onChanged: (v) => _onItemCheckedChange(item, v),
//                 ),
//               ),
//               if (item.id != widget.items!.last.id)
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20.w, 5.h, 30.h, 5.h),
//                   child: Container(
//                     height: 2.h,
//                     // width: double.infinity,
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                 ),
//             ],
//           )
//         : const SizedBox();
//   }
// }

// class _CheckBoxWithTitle extends StatelessWidget {
//   final bool value;
//   final Widget widget;

//   final Function(bool) onChanged;
//   const _CheckBoxWithTitle({required this.value, required this.widget, required this.onChanged});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onChanged(!value);
//       },
//       child: Container(
//         color: Colors.transparent,
//         padding: EdgeInsets.symmetric(
//           horizontal: 10.w,
//           vertical: 12.h,
//         ),
//         child: Row(
//           children: [
//             DecoratedBox(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: value ? Co.secondry : Co.black, width: 2.h),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(4.r),
//                 child: AnimatedScale(
//                   duration: Durations.short4,
//                   scale: value != true ? 0 : 1,
//                   child: CircleAvatar(backgroundColor: Co.secondry, radius: 5.r),
//                 ),
//               ),
//             ),
//             SizedBox(width: 20.w),
//             Expanded(
//               child: widget,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
