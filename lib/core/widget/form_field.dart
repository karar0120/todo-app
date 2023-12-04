import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color.dart';

class DefaultFormField extends StatelessWidget {
  final String labelText;
  final ScrollController? scrollController;
  final TextEditingController controller;
  final TextInputType type;
  final Function onSubmit;
  final Function onChange;
  final Function onTap;
  final bool obscureText;
  final Function validate;
  final String? hintText;
  final String? suffixText;
  final Widget? prefixIcon;
  final Function prefixPressed;
  final Widget? suffixIcon;
  final Color suffixColor;
  final int? maxLines;
  final Color prefixColor;
  final dynamic initialValue;
  final Function suffixPressed;
  final bool isClickable;
  final bool readOnly;
  final bool autoFocus;
  final FocusNode? focusNode;
  final bool removeBorder;
  final double height;
  final double? width;
  final bool? timePickerFree;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? keyboardType;
  final List<TextInputFormatter>? inputFormat;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;

  const DefaultFormField(
      {Key? key,
      this.scrollController,
      this.keyboardType,
      required this.labelText,
      required this.controller,
      required this.type,
      required this.onSubmit,
      required this.onChange,
      this.suffixText,
      required this.focusNode,
      required this.onTap,
      this.removeBorder = true,
      this.obscureText = false,
      this.timePickerFree = true,
      required this.validate,
      this.inputFormat,
      this.prefixColor = ColorsManager.mainBlue,
      this.prefixIcon,
      this.onEditingComplete,
      required this.prefixPressed,
      this.suffixIcon,
      this.suffixColor = ColorsManager.mainBlue,
      required this.suffixPressed,
      this.isClickable = true,
      this.readOnly = false,
      this.autofillHints,
      this.contentPadding,
      this.initialValue,
      this.height = 58,
      this.width,
      this.maxLines,
      this.hintText,
      this.autoFocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: isClickable == false
            ? () {
                onTap();
              }
            : null,
        child: Container(
          alignment: AlignmentDirectional.center,
          //padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          //decoration: removeBorder ? const BoxDecoration() : null,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              key: key,
              inputFormatters: inputFormat,
              scrollController: scrollController,
              textInputAction: keyboardType ?? TextInputAction.done,
              maxLines: maxLines,
              autofocus: autoFocus,
              controller: controller,
              focusNode: focusNode,
              keyboardType: type,
              obscureText: obscureText,
              readOnly: readOnly,
              enabled: isClickable,
              initialValue: initialValue,
              onFieldSubmitted: (val) {
                onSubmit();
              },
              onChanged: (val) {
                onChange();
              },
              onTap: () {
                onTap();
              },
              cursorColor: ColorsManager.mainBlue,
              decoration: InputDecoration(
                suffixText: suffixText,
                labelText: labelText,
                hintText: hintText,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0.r),
                  borderSide: const BorderSide(
                    //color: Colors.red,
                    color: ColorsManager.gray,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0.r),
                  borderSide: const BorderSide(
                    color: ColorsManager.gray,
                    width: 0.5,
                  ),
                ),
                prefixIcon: prefixIcon != null
                    ? IconButton(
                        icon: prefixIcon!,
                        onPressed: () {
                          prefixPressed();
                        },
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? IconButton(
                        onPressed: () {
                          suffixPressed();
                        },
                        icon: suffixIcon!,
                      )
                    : null,
                labelStyle: TextStyle(
                    color:
                        isClickable ? Colors.grey[400] : ColorsManager.mainBlue,
                    fontSize: 14),
                fillColor: Colors.white,
                filled: removeBorder ? true : false,
                errorStyle: const TextStyle(color: Colors.black),
                //floatingLabelBehavior: FloatingLabelBehavior.never,
                // contentPadding: const EdgeInsets.only(
                //     right: 10, left: 10, bottom: 10, top: 10),
              ),
              style: (readOnly == true && timePickerFree == false)
                  ? Theme.of(context).textTheme.displayLarge
                  : Theme.of(context).textTheme.bodyLarge,
              autofillHints: autofillHints,
              onEditingComplete: onEditingComplete,
            ),
          ),
        ),
      ),
    );
  }
}
