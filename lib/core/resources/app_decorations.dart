import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/resources/resources.dart';
import 'localization/localization_map.dart';

class AppDecorations {
  InputDecoration inputDecorationWithHint({
    required String hintText,
    TextStyle? hintTextStyle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? filledColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? prefixIconConstraints,
    Color? borderColor,
    bool isReadOnly = false,
    bool isLocalized = true,
    bool? showBorder,
    Color? hintColor,
  }) {
    return InputDecoration(
      // contentPadding: EdgeInsets.symmetric(
      //   horizontal: prefixIcon != null
      //       ? (horizontalPadding ?? 16)
      //       : (horizontalPadding ?? 16),
      //   vertical: verticalPadding ?? 14,
      // ),
      fillColor: filledColor ?? R.appColors.surfaceVariant,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        borderSide:
            (showBorder ?? false)
                ? BorderSide(color: R.appColors.red, width: 1.2)
                : BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        borderSide: BorderSide(color: R.appColors.red, width: 1.2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        borderSide: BorderSide(
          color:
              isReadOnly
                  ? borderColor ?? Colors.transparent
                  : borderColor ?? R.appColors.outline,
          width: 1.2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        borderSide: BorderSide(color: R.appColors.red, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        borderSide: BorderSide(
          color: borderColor ?? R.appColors.outline,
          width: 1.2,
        ),
      ),
      errorMaxLines: 2,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: prefixIcon,
            )
          : null,
      prefixIconConstraints: prefixIcon != null
          ? BoxConstraints(
              maxWidth: prefixIconConstraints ?? 50,
              minWidth: prefixIconConstraints ?? 50,
            )
          : null,
      contentPadding: EdgeInsets.symmetric(
        horizontal: prefixIcon != null ? 16 : (horizontalPadding ?? 16),
        vertical: verticalPadding ?? 14,
      ),
      hintText: isLocalized ? hintText.L() : hintText,
      isDense: true,
      errorStyle: R.textStyles.poppins(
        fontSize: 10.px,
        color: R.appColors.red,
      ),
      hintStyle: hintTextStyle ?? R.textStyles.poppins(
                  fontSize: 12.px,
                  color: R.appColors.textSecondary
              ),

    );
  }

  BoxDecoration verticalRadiusBoxDec({
    Color? backgroundColor,
    double? radius,
    bool? radiusFromBottom,
    bool? hideShadow,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? R.appColors.primary,
      boxShadow:
          (hideShadow ?? false)
              ? []
              : [
                BoxShadow(
                  color: R.appColors.black.withValues(alpha: .15),
                  blurRadius: 4,
                  spreadRadius: 6,
                ),
              ],
      borderRadius: BorderRadius.vertical(
        bottom:
            (radiusFromBottom ?? false)
                ? Radius.circular(radius ?? 28)
                : Radius.circular(0),
        top:
            (radiusFromBottom ?? false)
                ? Radius.circular(0)
                : Radius.circular(radius ?? 28),
      ),
    );
  }

  BoxDecoration generalDecoration({Color? backgroundColor, double? radius}) {
    return BoxDecoration(
      color: backgroundColor ?? R.appColors.primary,
      // boxShadow: [
      //   BoxShadow(
      //     color: R.appColors.shadowColor,
      //     blurRadius: 2,
      //     spreadRadius: 2,
      //   ),
      // ],
      borderRadius: BorderRadius.circular(radius ?? 8),
    );
  }

  BoxDecoration generalDecorationWithBorder({
    Color? backgroundColor,
    double? radius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? R.appColors.primary,
      border: Border.all(color: R.appColors.secondary),
      borderRadius: BorderRadius.circular(radius ?? 8),
    );
  }

  InputDecoration inputDecoration({
    required String hintText,
    Widget? suffixIcon,
    Color? filledColor,
    Color? borderColor,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hintText == "" ? null : hintText.L(),
      hintStyle: R.textStyles.poppins(
        fontSize: 14.px,
        color: R.appColors.textSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: filledColor ?? R.appColors.outline,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: filledColor ?? Colors.transparent,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      errorStyle: R.textStyles.poppins(
        fontSize: 12.px,
        color: R.appColors.red,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: filledColor ?? R.appColors.outline,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.textSecondary,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.red,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.red,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
    );
  }

  BoxDecoration containerDecoration({
    Color color = const Color(0xffE4E4EB),
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
  }) {
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
            spreadRadius: 3,
            blurRadius: 7,
            color: R.appColors.black.withValues(alpha: .04))
      ],
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  BoxDecoration msgCardDecoration(
      {required Color backgroundColor,
        double? borderRadius,
        required bool isSender}) {
    return BoxDecoration(
      borderRadius: isSender
          ? BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 12),
          bottomRight: Radius.circular(borderRadius ?? 12),
          bottomLeft: Radius.circular(borderRadius ?? 12))
          : BorderRadius.only(
        topRight: Radius.circular(borderRadius ?? 12),
        bottomLeft: Radius.circular(borderRadius ?? 12),
        bottomRight: Radius.circular(borderRadius ?? 12),
      ),
      color: backgroundColor,
    );
  }


  BoxDecoration authSheetDecoration({double? borderRadius}){
    return BoxDecoration(
      color: R.appColors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius ?? 18)),
      // boxShadow: [
      //   BoxShadow(
      //     color: R.appColors.black.withValues(alpha: 0.25),
      //     blurRadius: 4,
      //     offset: const Offset(0, 4),
      //   ),
      // ],
    );
  }

}
