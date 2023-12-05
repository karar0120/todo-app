import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/strings_manger.dart';
import '../../../../../../core/utils/values_manger.dart';
import '../../../../../../core/widget/main_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: const Text(AppString.todoAppTitleCaptilaze),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.s8.w, vertical: AppSize.s2.h),
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.calendar_month)),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.s100.h);
}
