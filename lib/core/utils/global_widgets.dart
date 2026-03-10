import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, GetNavigation;
import 'package:sizer/sizer.dart';

import '../resources/resources.dart';

class GlobalWidgets{
  static Widget buildBackButton() {
    return GestureDetector(
      onTap: Get.back,
      child: Container(
        height: 40.px,
        width: 40.px,
        margin: EdgeInsets.all(10) + EdgeInsets.only(left: 10, right: 5),
        decoration: BoxDecoration(
          color: R.appColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: R.appColors.borderColor, width: 1),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.px,
          color: R.appColors.black,
        ),
      ),
    );
  }
}