import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../resources/resources.dart';


class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const BackButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      child: Container(
        height: 40.px,
        width: 40.px,
        decoration: BoxDecoration(
          color: R.appColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: R.appColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: R.appColors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
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
