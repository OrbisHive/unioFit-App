import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Status Timeline Widget
/// Displays competition progress timeline
class CompetitionStatusTimelineWidget extends StatelessWidget {
  final String status;
  final bool hasSubmitted;
  final bool isDark;

  const CompetitionStatusTimelineWidget({
    super.key,
    required this.status,
    required this.hasSubmitted,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      {"label": "enrolled".L(), "completed": true},
      {
        "label": "submission_received".L(),
        "completed": hasSubmitted || status == "JUDGING" || status == "ANNOUNCED"
      },
      {
        "label": "under_judging".L(),
        "completed": status == "JUDGING" || status == "ANNOUNCED"
      },
      {
        "label": "winner_announced".L(),
        "completed": status == "ANNOUNCED"
      },
    ];

    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Competition Status",
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h3,
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final isCompleted = step["completed"] as bool;
            final isLast = index == steps.length - 1;

            return _buildTimelineStep(
              stepNumber: index + 1,
              label: step["label"] as String,
              isCompleted: isCompleted,
              isLast: isLast,
              isDark: isDark,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required int stepNumber,
    required String label,
    required bool isCompleted,
    required bool isLast,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 32.px,
              height: 32.px,
              decoration: BoxDecoration(
                color: isCompleted
                    ? R.appColors.success
                    : (isDark
                        ? R.appColors.darkSurfaceVariant
                        : R.appColors.surfaceVariant),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted
                      ? R.appColors.success
                      : R.appColors.outline,
                  width: 2,
                ),
              ),
              child: Center(
                child: isCompleted
                    ? Icon(
                        Icons.check,
                        size: 18.px,
                        color: R.appColors.white,
                      )
                    : Text(
                        "$stepNumber",
                        style: R.textStyles.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? R.appColors.darkTextSecondary
                              : R.appColors.textSecondary,
                        ),
                      ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40.px,
                color: isCompleted
                    ? R.appColors.success
                    : (isDark
                        ? R.appColors.darkSurfaceVariant
                        : R.appColors.surfaceVariant),
              ),
          ],
        ),
        w2,
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 6.px),
            child: Text(
              label,
              style: R.textStyles.poppins(
                fontSize: 14,
                fontWeight: isCompleted
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: isCompleted
                    ? R.appColors.success
                    : (isDark
                        ? R.appColors.darkTextSecondary
                        : R.appColors.textSecondary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

