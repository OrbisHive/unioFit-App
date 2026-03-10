import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'resources.dart';

class AppTextStyles {
  TextStyle poppins(
      {TextDecoration? textDecoration,
      Color? color,
        Color? decorationColor, // 👈 Added this
        double? fontSize,
      bool shouldApplyTextHeight = false,
      FontWeight? fontWeight,
      double? letterSpacing,
      }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 15.px,
      color: color ?? R.appColors.black,
      height: shouldApplyTextHeight == false ? null : 1.5,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? color ?? R.appColors.white, // 👈 Apply color to underline/strike

    );
  }

  TextStyle playfairDisplay({
    TextDecoration? textDecoration,
    Color? color,
    Color? decorationColor, // 👈 Added this
    double? fontSize,
    double? height,
    bool shouldApplyTextHeight = false,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: fontSize ?? 15.px,
      color: color ?? R.appColors.black,
      height: shouldApplyTextHeight == false ? null : height ?? 1.5,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? color ?? R.appColors.white, // 👈 Apply color to underline/strike
    );
  }


  TextStyle figtreeFont(
      {TextDecoration? textDecoration,
        Color? color,
        double? fontSize,
        double? height,
        bool shouldApplyTextHeight = false,
        FontWeight? fontWeight,
        double? letterSpacing}) {
    return GoogleFonts.figtree(
      fontSize: fontSize ?? 15.px,
      color: color ?? R.appColors.black,
      height: shouldApplyTextHeight == false ? null :height ?? 1.5,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }

  TextStyle urbanist(
      {TextDecoration? textDecoration,
        Color? color,
        double? fontSize,
        double? height,
        bool shouldApplyTextHeight = false,
        FontWeight? fontWeight,
        double? letterSpacing}) {
    return GoogleFonts.urbanist(
      fontSize: fontSize ?? 15.px,
      color: color ?? R.appColors.darkSurface,
      height: shouldApplyTextHeight == false ? null :height ?? 1.5,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }

  TextStyle roboto({
    TextDecoration? textDecoration,
    Color? color,
    Color? decorationColor,
    double? fontSize,
    double? height,
    bool shouldApplyTextHeight = false,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 15.px,
      color: color ?? R.appColors.black,
      height: shouldApplyTextHeight == false ? null : height ?? 1.5,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? color ?? R.appColors.white,
    );
  }


}
