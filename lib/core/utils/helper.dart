import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../resources/localization/localization_map.dart';
import '../resources/resources.dart';
import 'ZBotToast.dart';

class Helper{
  static Future showSnackBar(String message,
      {bool isError = false, required BuildContext context}) async {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: R.appColors.white,
        elevation: .5,
        padding: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Text(
          message,
          style: R.textStyles.poppins(
            fontSize: 12.px,
            fontWeight: FontWeight.w500,
            color: R.appColors.black,
          ),
        ),
      ),
    );
  }

  static DateTime? currentBackPressTime;

  static Future<bool> onWillPop() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      ZBotToast.showToastError(

        message: LocalizationMap.getValues("press_again_to_exit"),
        duration: Duration(seconds: 1),
      );

      return Future.value(false);
    }
    return Future.value(true);
  }
}