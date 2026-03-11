import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/utils/app_button.dart';
import 'dashboard_widget_helpers.dart';

/// Empty Dashboard State Widget
/// Displayed when there are no competitions available
class EmptyDashboardState extends StatelessWidget {
  final bool isDark;

  const EmptyDashboardState({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration placeholder
          Container(
            width: 120.px,
            height: 120.px,
            decoration: BoxDecoration(
              color: isDark 
                  ? R.appColors.darkSurfaceVariant 
                  : R.appColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.fitness_center,
              size: 60.px,
              color: DashboardWidgetHelpers.getTextColor(
                isDark: isDark,
                isPrimary: false,
              ),
            ),
          ),
          h4,
          // Message text
          DashboardWidgetHelpers.styledText(
            text: "no_competition_right_now".L(),
            isDark: isDark,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            isPrimary: true,
            textAlign: TextAlign.center,
          ),
          h2,
          DashboardWidgetHelpers.styledText(
            text: "we_are_planning_something_big".L(),
            isDark: isDark,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            isPrimary: false,
            textAlign: TextAlign.center,
          ),
          h2,
          DashboardWidgetHelpers.styledText(
            text: "browse_gyms_around_you".L(),
            isDark: isDark,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            isPrimary: false,
            textAlign: TextAlign.center,
          ),
          h4,
          // CTA Button
          AppButton(
            onPressed: () {
              // Navigation will be implemented later
            },
            title: "find_gyms".L(),
            textColor: DashboardWidgetHelpers.getButtonTextColor(context),
            textSize: 16,
            textWeight: FontWeight.w600,
            height: 50,
            radius: 12,
          ),
        ],
      ),
    );
  }
}

