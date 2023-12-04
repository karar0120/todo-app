import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/extensions.dart';

import '../../../../../../core/utils/strings_manger.dart';
import '../../../../../../core/utils/values_manger.dart';
import '../../../../../../core/widget/main_app_bar.dart';

class TodoEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoEditAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      title: const Text(AppString.editTask),
      leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: AppSize.s18,
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.s100.h);
}
