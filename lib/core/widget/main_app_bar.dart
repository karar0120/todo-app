import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/values_manger.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? leadingWidth;
  final bool? centerTitle;
  final double? padding;
  final Color? appBarColor;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final double? appbarPreferredSize;
  final Color? appbarBackButtonColor;

  const MainAppBar(
      {Key? key,
      this.title,
      this.leadingWidth,
      this.centerTitle,
      this.appBarColor,
      this.leading,
      this.actions,
      this.appbarPreferredSize = AppSize.s100,
      this.elevation = 0.0,
      this.padding = 0.0,
      this.appbarBackButtonColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: leadingWidth,
        centerTitle: centerTitle ?? false,
        title: title,
        elevation: elevation,
        leading: leading,
        actions: actions,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appbarPreferredSize?.h ?? kToolbarHeight);
}
