import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/heights_widths.dart';
import '../resources/resources.dart';
import 'my_loader.dart';

class ZBotToast {
  static loadingShow() async {
    BotToast.showCustomLoading(
      toastBuilder: (func) {
        return MyLoader(color: R.appColors.primary);
      },
      allowClick: false,
      clickClose: false,
      backgroundColor: Colors.transparent,
    );
    Future.delayed(const Duration(minutes: 3), () {
      loadingClose();
    });
  }

  static Future loadingClose() async {
    BotToast.cleanAll();
    await Future.delayed(const Duration(milliseconds: 100));
  }

  static showToastSuccess({
    String? title,
    String? message,
    String? image,
    Duration? duration,
    double? width,
    Color? iconColor,
    double? iconSize,
    Color? bgColor,
    bool boxShadow = false,
    Color? messageColor,
  }) async {
    await loadingClose();

    BotToast.showCustomText(
      align: width != null ? Alignment.topRight : Alignment.topRight,
      toastBuilder: (func) {
        return Column(
          children: <Widget>[
            // const Spacer(),
            Container(
              width: width ?? 390,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: bgColor ?? R.appColors.lightGreenColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: R.appColors.greenToast),
                boxShadow: boxShadow == true
                    ? [
                        BoxShadow(
                          color: R.appColors.greyColor.withValues(alpha: 0.17),
                          offset: const Offset(0, 6),
                          blurRadius: 22,
                        ),
                      ]
                    : [],
              ),
              child: Row(
                children: <Widget>[
                  if (image == null)
                    Image.asset(R.appImages.checkIcon, scale: 3.5)
                  else
                    Image.asset(
                      R.appImages.checkIcon,
                      height: iconSize ?? 35,
                      width: iconSize ?? 35,
                    ),
                  // Icon(
                  //   Icons.check_circle_outline,
                  //   color: iconColor ?? R.colors.primaryColor,
                  //   size: width != null ? iconSize : null,
                  // ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (title != null)
                          Text(
                            title,
                            style: R.textStyles.poppins(
                              color: R.appColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.px,
                            ),
                          ),
                        h0P1,
                        Text(
                          message ?? '',
                          style: R.textStyles.poppins(
                            color:
                                messageColor ?? R.appColors.darkTextSecondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.px,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
      clickClose: true,
      crossPage: true,
      animationReverseDuration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static showToastError({
    String? title,
    String? message,
    String? image,
    Duration? duration,
    double? width,
    Color? iconColor,
    double? iconSize,
    Color? bgColor,
    bool boxShadow = false,
    Color? messageColor,
  }) async {
    await loadingClose();

    BotToast.showCustomText(
      align: width != null ? Alignment.topRight : Alignment.topRight,
      toastBuilder: (func) {
        return Column(
          children: <Widget>[
            // const Spacer(),
            Container(
              width: width ?? 390,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: bgColor ?? R.appColors.redToast,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: R.appColors.darkRedColor),
                boxShadow: boxShadow == true
                    ? [
                        BoxShadow(
                          color: R.appColors.greyColor.withValues(alpha: 0.17),
                          offset: const Offset(0, 6),
                          blurRadius: 22,
                        ),
                      ]
                    : [],
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (image == null)
                    Image.asset(R.appImages.errorIcon, scale: 3.5)
                  else
                    Image.asset(
                      R.appImages.errorIcon,
                      height: iconSize ?? 35,
                      width: iconSize ?? 35,
                    ),
                  // Icon(
                  //   Icons.check_circle_outline,
                  //   color: iconColor ?? R.colors.primaryColor,
                  //   size: width != null ? iconSize : null,
                  // ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (title != null)
                          Text(
                            title,
                            style: R.textStyles.poppins(
                              color: R.appColors.secondaryContainer,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.px,
                            ),
                          ),
                        h0P1,
                        Text(
                          message ?? '',
                          style: R.textStyles.poppins(
                            color:
                                messageColor ?? R.appColors.darkTextSecondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.px,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
      clickClose: true,
      crossPage: true,
      animationReverseDuration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static showToastSomethingWentWrong({Duration? duration}) async {
    await loadingClose();
    BotToast.showCustomText(
      toastBuilder: (func) {
        return Column(
          children: <Widget>[
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE6532D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.circle, color: Colors.white),
                  SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Oops!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Something went wrong',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
      clickClose: true,
      crossPage: true,
      animationReverseDuration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 5),
    );
  }

  static showMessage({
    required String message,
    Duration? duration,
    double? width,
    Color? bgColor,
    Color? textColor,
    Color? borderColor,
  }) async {
    await loadingClose();

    BotToast.showCustomText(
      align: Alignment.bottomCenter,
      toastBuilder: (func) {
        return Column(
          children: <Widget>[
            const Spacer(),
            Container(
              width: width ?? 300,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: bgColor ?? Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderColor ?? R.appColors.splashBackgroundColor,
                  width: 1,
                ),
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: R.textStyles.poppins(
                  color: textColor ?? R.appColors.splashBackgroundColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.px,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
      clickClose: true,
      crossPage: true,
      animationReverseDuration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static showToastSuccess2({
    String? title,
    required String message,
    Duration? duration,
  }) async {
    await loadingClose();

    BotToast.showCustomText(
      toastBuilder: (func) {
        return Material(
          color: R.appColors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: R.appColors.lightGreenColor,
              border: Border.all(color: R.appColors.greenToast, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: R.appColors.black.withValues(alpha: 0.2),
                  spreadRadius: 8,
                  blurRadius: 30,
                ),
              ],
            ),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              leading: Image.asset(R.appImages.checkIcon, scale: 4),
              title: title != null
                  ? Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: R.textStyles.poppins(
                        color: R.appColors.darkTextSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.px,
                      ),
                    )
                  : Text(
                      message,
                      style: R.textStyles.poppins(
                        color: R.appColors.darkTextSecondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.px,
                      ),
                    ),
              subtitle: title != null
                  ? Text(
                      message,
                      style: R.textStyles.poppins(
                        color: R.appColors.darkTextSecondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.px,
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
      clickClose: true,
      crossPage: true,
      animationReverseDuration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      align: Alignment.topCenter,
      duration: duration ?? const Duration(seconds: 5),
    );
  }

  static showToastError2({
    String? title,
    required String message,
    Duration? duration,
  }) async {
    await loadingClose();

    BotToast.showCustomText(
      toastBuilder: (func) {
        return Material(
          color: R.appColors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: R.appColors.red,
              border: Border.all(color: R.appColors.darkRedColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: R.appColors.black.withValues(alpha: 0.2),
                  spreadRadius: 8,
                  blurRadius: 30,
                ),
              ],
            ),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              leading: Image.asset(R.appImages.errorIcon, scale: 4),
              visualDensity: VisualDensity.compact,
              title: title != null
                  ? Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: R.textStyles.poppins(
                        color: R.appColors.darkTextSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.px,
                      ),
                    )
                  : Text(
                      message,
                      style: R.textStyles.poppins(
                        color: R.appColors.darkTextSecondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px,
                      ),
                    ),
              subtitle: title != null
                  ? Text(
                      message,
                      style: R.textStyles.poppins(
                        color: R.appColors.darkTextSecondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px,
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
      clickClose: true,
      crossPage: true,
      align: Alignment.topCenter,
      animationReverseDuration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  // static showSnackBar({required BuildContext context, required String message}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }
}
