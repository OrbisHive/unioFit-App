
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';
import 'package:unio_fit/core/utils/safe_area_widget.dart';
import '../constants/heights_widths.dart';
import '../resources/resources.dart';
import 'app_button.dart';

class CongratulationView extends StatelessWidget {
  static const String route = "/congratulationView";

  final String image;
  final String title;
  final String subtitle;
  final String buttonTitle;
  final double imageScale;
  final VoidCallback onPressed;

  const CongratulationView({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.buttonTitle = 'home',
    this.imageScale = 4.5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.appColors.white,
      body: _buildCongratulationContent(),
    );
  }

  Widget _buildCongratulationContent() {
    return SafeAreaWidget(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            h15,
            Image.asset(image, scale: imageScale),
            h4,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                title.L(),
                textAlign: TextAlign.center,
                style: R.textStyles.playfairDisplay(
                  fontSize: 24.px,
                  fontWeight: FontWeight.w800,
                  color: R.appColors.primary,
                ),
              ),
            ),
            h0P3,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                subtitle.L(),
                textAlign: TextAlign.center,
                style: R.textStyles.poppins(
                  fontSize: 13.px,
                  fontWeight: FontWeight.w400,
                  color: R.appColors.primary,
                ),
              ),
            ),
            h4,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: AppButton(
                onPressed: onPressed,
                title: buttonTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


