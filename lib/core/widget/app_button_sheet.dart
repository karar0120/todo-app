import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theming/color.dart';

void showCustomBottomSheet(BuildContext context,
    {required Widget bottomSheetContent, required double bottomSheetHeight}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: bottomSheetHeight.sh,
          child: Stack(
            children: [
              Positioned(
                right: 0.4.sw,
                left: 0.4.sw,
                top: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 5,
                  decoration: BoxDecoration(
                      color: ColorsManager.gray,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              bottomSheetContent
            ],
          ),
        );
      });
}
