import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/core/utils/values_manger.dart';

void errorBotToast({required String title}) {
  BotToast.showSimpleNotification(
      title: title,
      titleStyle: TextStyles.font16WhiteSemiBold,
      closeIcon: const Icon(Icons.close_rounded),
      hideCloseButton: false,
      subTitleStyle: TextStyles.font16WhiteSemiBold,
      backgroundColor: Colors.red,
      borderRadius: AppSize.s14.r);
}

void doneBotToast({required String title}) {
  BotToast.showSimpleNotification(
      titleStyle: TextStyles.font16WhiteSemiBold,
      closeIcon: const Icon(Icons.check),
      hideCloseButton: false,
      title: title,
      subTitleStyle: TextStyles.font16WhiteSemiBold,
      backgroundColor: Colors.green,
      borderRadius: AppSize.s14.r);
}
