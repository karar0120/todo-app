import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/color.dart';
import 'package:todo_app/core/utils/values_manger.dart';

import '../theming/styles.dart';
import '../utils/strings_manger.dart';

showAlertDialogContinue(BuildContext context,
    {required String content,
    Widget? widgetContent,
    onOk,
    Widget? buttonText,
    required VoidCallback continuePressed}) {
  Widget okButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent)),
    onPressed: onOk ??
        () {
          Navigator.pop(context);
        },
    child: Text(
      AppString.cancel,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  );
  Widget continueButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.mainPurple)),
    onPressed: continuePressed,
    child: buttonText ??
        Text(
          AppString.continues,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    content: Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: widgetContent ??
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyles.font18DarkBlueMedium,
          ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: okButton,
      ),
      Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: continueButton,
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
