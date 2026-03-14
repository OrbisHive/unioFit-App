import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
class PrivacyPolicyScreen extends StatelessWidget {
  static const route = "/privacy-policy";
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "privacy_policy_title".L(),
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
              _heading(context, "pp_1_intro"),
              _text(context, "pp_1_text"),

              _heading(context, "pp_2_collect"),
              _bullet(context, "pp_2_1"),
              _bullet(context, "pp_2_2"),
              _bullet(context, "pp_2_3"),
              _bullet(context, "pp_2_4"),
              _bullet(context, "pp_2_5"),

              _heading(context, "pp_3_use"),
              _bullet(context, "pp_3_1"),
              _bullet(context, "pp_3_2"),
              _bullet(context, "pp_3_3"),
              _bullet(context, "pp_3_4"),
              _bullet(context, "pp_3_5"),

              _heading(context, "pp_4_competition"),
              _bullet(context, "pp_4_1"),
              _bullet(context, "pp_4_2"),
              _bullet(context, "pp_4_3"),

              _heading(context, "pp_5_prize"),
              _bullet(context, "pp_5_1"),
              _bullet(context, "pp_5_2"),
              _bullet(context, "pp_5_3"),

              _heading(context, "pp_6_gym"),
              _bullet(context, "pp_6_1"),
              _bullet(context, "pp_6_2"),
              _bullet(context, "pp_6_3"),

              _heading(context, "pp_7_notifications"),
              _bullet(context, "pp_7_1"),
              _bullet(context, "pp_7_2"),
              _bullet(context, "pp_7_3"),

              _heading(context, "pp_8_security"),
              _bullet(context, "pp_8_1"),
              _bullet(context, "pp_8_2"),
              _bullet(context, "pp_8_3"),

              _heading(context, "pp_9_sharing"),
              _bullet(context, "pp_9_1"),
              _bullet(context, "pp_9_2"),
              _bullet(context, "pp_9_3"),

              _heading(context, "pp_10_rights"),
              _bullet(context, "pp_10_1"),
              _bullet(context, "pp_10_2"),
              _bullet(context, "pp_10_3"),

              _heading(context, "pp_11_changes"),
              _bullet(context, "pp_11_1"),
              _bullet(context, "pp_11_2"),
              _bullet(context, "pp_11_3"),

              _heading(context, "pp_12_contact"),
              _bullet(context, "pp_12_1"),

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