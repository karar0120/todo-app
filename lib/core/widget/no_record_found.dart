import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theming/styles.dart';

import '../utils/strings_manger.dart';
import '../utils/values_manger.dart';

Widget noRecordFound() {
  return SizedBox(
      height: AppSize.s70.h,
      child: Center(
          child: Text(
        AppString.noRecordsFound,
        style: TextStyles.font14DarkBlueMedium,
      )));
}
