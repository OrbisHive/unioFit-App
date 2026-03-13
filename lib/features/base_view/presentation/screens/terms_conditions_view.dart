import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  static const route = "/terms-condition";

  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "terms_conditions_title".L(),
          style: R.textStyles.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? R.appColors.white : R.appColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading(context, "tc_1_intro"),
              _text(context, "tc_1_text"),

              _heading(context, "tc_2_eligibility"),
              _bullet(context, "tc_2_1"),
              _bullet(context, "tc_2_2"),
              _bullet(context, "tc_2_3"),

              _heading(context, "tc_3_competition"),
              _bullet(context, "tc_3_1"),
              _bullet(context, "tc_3_2"),
              _bullet(context, "tc_3_3"),
              _bullet(context, "tc_3_4"),
              _bullet(context, "tc_3_5"),

              _heading(context, "tc_4_winner"),
              _bullet(context, "tc_4_1"),
              _bullet(context, "tc_4_2"),
              _bullet(context, "tc_4_3"),

              _heading(context, "tc_5_prize"),
              _bullet(context, "tc_5_1"),
              _bullet(context, "tc_5_2"),
              _bullet(context, "tc_5_3"),
              _bullet(context, "tc_5_4"),

              _heading(context, "tc_6_gym"),
              _bullet(context, "tc_6_1"),
              _bullet(context, "tc_6_2"),
              _bullet(context, "tc_6_3"),

              _heading(context, "tc_7_account"),
              _bullet(context, "tc_7_1"),
              _bullet(context, "tc_7_2"),
              _bullet(context, "tc_7_3"),

              _heading(context, "tc_8_notifications"),
              _bullet(context, "tc_8_1"),
              _bullet(context, "tc_8_2"),

              _heading(context, "tc_9_data"),
              _bullet(context, "tc_9_1"),
              _bullet(context, "tc_9_2"),
              _bullet(context, "tc_9_3"),

              _heading(context, "tc_10_prohibited"),
              _bullet(context, "tc_10_1"),
              _bullet(context, "tc_10_2"),
              _bullet(context, "tc_10_3"),
              _bullet(context, "tc_10_4"),

              _heading(context, "tc_11_liability"),
              _bullet(context, "tc_11_1"),
              _bullet(context, "tc_11_2"),
              _bullet(context, "tc_11_3"),

              _heading(context, "tc_12_admin"),
              _bullet(context, "tc_12_1"),
              _bullet(context, "tc_12_2"),
              _bullet(context, "tc_12_3"),

              SizedBox(height: 3.h),

              Center(
                child: Text(
                  "last_updated_march_2026".L(),
                  style: R.textStyles.poppins(
                    fontSize: 10.sp,
                    color: isDark ? R.appColors.white : Colors.grey,
                  ),
                ),
              ),

              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context, String key) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
      child: Text(
        key.L(),
        style: R.textStyles.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: isDark ? R.appColors.white : R.appColors.black,
        ),
      ),
    );
  }

  Widget _text(BuildContext context, String key) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      key.L(),
      style: R.textStyles.poppins(
        fontSize: 15.sp,
        color: isDark ? R.appColors.white : Colors.grey.shade800,
      ),
    );
  }

  Widget _bullet(BuildContext context, String key) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•  ",
            style: R.textStyles.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),
          Expanded(
            child: Text(
              key.L(),
              style: R.textStyles.poppins(
                fontSize: 14.3.sp,
                color: isDark ? R.appColors.white : Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}