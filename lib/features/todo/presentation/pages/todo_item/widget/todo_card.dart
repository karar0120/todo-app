import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/utils/values_manger.dart';
import '../../../../domain/entities/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p8.w, vertical: AppPadding.p14.w),
      child: Container(
        height: AppSize.s120.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s15.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p12.w, vertical: AppPadding.p16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    todo.title,
                    style: TextStyles.font16BlueSemiBold,
                  ),
                  const Spacer(),
                  Text(
                    todo.dataTime,
                    style: TextStyles.font16BlueSemiBold,
                  ),
                ],
              ),
              verticalSpace(AppSize.s8),
              Expanded(
                child: Text(
                  todo.description,
                  style: TextStyles.font14DarkBlueMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
