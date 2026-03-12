import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Rules Widget
/// Displays competition rules and requirements
class CompetitionRulesWidget extends StatelessWidget {
  final List<String> rules;
  final bool isDark;

  const CompetitionRulesWidget({
    super.key,
    required this.rules,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "rules_and_requirements".L(),
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h3,
          ...rules.map((rule) => Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: R.textStyles.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: R.appColors.primary,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        rule,
                        style: R.textStyles.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isDark
                              ? R.appColors.darkTextSecondary
                              : R.appColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

