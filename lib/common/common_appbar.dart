
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.title = '',
    this.titleSpacing,
    this.leading,
    this.leadingWidth,
    this.leadingSpacing,
    this.titleColor = colorTextPrimary,
    this.bgColor,
    this.elevation = 0.0,
    this.centerTitle = true,
    this.titleWidget,
    this.isBackButton = true,
    this.withBackTxt = true,
    this.backButtonColor,
    this.onPressedBackBtn,
    this.trailing,
    this.bottom,
    this.isSearchingMode = false,
    this.height = 44,
    this.systemOverlayStyle,
    this.withBottomBorder = true,
    this.showBottomLine = false,
  });

  final String title;
  final double? titleSpacing;
  final Widget? leading;
  final double? leadingWidth;
  final double? leadingSpacing;
  final Color? bgColor;
  final Color titleColor;
  final double? elevation;
  final bool centerTitle;
  final Widget? titleWidget;
  final bool isBackButton;
  final bool withBackTxt;
  final Color? backButtonColor;
  final void Function()? onPressedBackBtn;
  final List<Widget>? trailing;
  final PreferredSizeWidget? bottom;
  final bool isSearchingMode;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double height;
  final bool withBottomBorder;
  final bool showBottomLine;

  CommonAppBar.scrollAware({
    super.key,
    this.title = '',
    this.titleSpacing,
    this.leading,
    this.leadingWidth,
    this.leadingSpacing,
    this.titleColor = colorTextPrimary,
    this.bgColor,
    this.elevation = 0.0,
    this.centerTitle = true,
    this.titleWidget,
    this.isBackButton = true,
    this.withBackTxt = true,
    this.backButtonColor,
    this.onPressedBackBtn,
    this.trailing,
    this.isSearchingMode = false,
    this.height = 44,
    this.systemOverlayStyle,
    this.withBottomBorder = true,
    this.showBottomLine = false,
  }) : bottom = PreferredSize(
    preferredSize: const Size.fromHeight(0.33),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: showBottomLine ? colorTextPlaceholder : Colors.transparent,
      height: 0.33,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isSearchingMode
          ? MediaQuery.of(context).viewPadding.top
          : ((MediaQuery.of(context).viewPadding.top) +
          height +
          (bottom?.preferredSize.height ?? 0)),
      child: AppBar(
        systemOverlayStyle: systemOverlayStyle,
        elevation: elevation,
        toolbarHeight: height,
        backgroundColor: bgColor ?? colorBackground,
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        leadingWidth: leadingWidth ?? 90.w,
        // leading: isBackButton
        //     ? CustomLeadingIcon(
        //   buttonOnPressed: onPressedBackBtn,
        //   backButtonColor: backButtonColor,
        //   withBackTxt: withBackTxt,
        // )
        //     : leading,
        titleSpacing: titleSpacing,
        title: isSearchingMode
            ? const SizedBox()
            : Padding(
          padding: EdgeInsets.only(left: leadingSpacing ?? 0),
          child: titleWidget ??
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: colorTextPrimary,
                ),
              ),
        ),
        actions: trailing,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}

// class CustomLeadingIcon extends StatelessWidget {
//   const CustomLeadingIcon({
//     super.key,
//     this.buttonOnPressed,
//     this.backButtonColor,
//     this.childIcon = 'assets/svgs/Back.svg',
//     this.withBackTxt = true,
//     this.badgeView,
//     this.needPadding = true,
//   });
//
//   final void Function()? buttonOnPressed;
//   final Color? backButtonColor;
//   final String childIcon;
//   final bool withBackTxt;
//   final bool needPadding;
//   final Widget? badgeView;
//
//   @override
//   Widget build(BuildContext context) {
//     Color color = backButtonColor ?? Colors.blue;
//
//     return OpacityEffect(
//       child: ,
//     );
//   }
// }
