import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/utils/app_button.dart';
import '../dashboard_widget_helpers.dart';
import '../enhanced_enroll_button.dart';
import 'competition_submission_section.dart';

/// Competition Action Section
/// Handles enrollment, submission, and check-in actions
class CompetitionActionSection extends StatelessWidget {
  final String competitionStatus;
  final String competitionType;
  final bool isUserEnrolled;
  final bool hasSubmitted;
  final VoidCallback? onEnroll;
  final VoidCallback? onCheckIn;
  final bool isDark;

  const CompetitionActionSection({
    super.key,
    required this.competitionStatus,
    required this.competitionType,
    required this.isUserEnrolled,
    required this.hasSubmitted,
    this.onEnroll,
    this.onCheckIn,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    // Enroll button (if not enrolled and status is ACTIVE)
    if (!isUserEnrolled && competitionStatus == "ACTIVE") {
      return EnhancedEnrollButton(
        onPressed: onEnroll,
        icon: Icons.local_fire_department,
        title: "enroll_now",
      );
    }

    // If enrolled and ONLINE competition
    if (isUserEnrolled && competitionType == "ONLINE" && !hasSubmitted) {
      return CompetitionSubmissionSection(
        isDark: isDark,
        onSubmissionSuccess: () {
          // Handle submission success
        },
      );
    }

    // If enrolled and OFFLINE competition
    if (isUserEnrolled && competitionType == "OFFLINE") {
      return DashboardWidgetHelpers.cardContainer(
        isDark: isDark,
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "gym_check_in".L(),
              style: R.textStyles.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? R.appColors.darkTextPrimary
                    : R.appColors.textPrimary,
              ),
            ),
            h2,
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: R.appColors.primary,
                  size: 24.px,
                ),
                w1,
                Expanded(
                  child: Text(
                    "${"selected_gym".L()}: Fitness Plus Gym",
                    style: R.textStyles.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? R.appColors.darkTextSecondary
                          : R.appColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            h3,
            AppIconButton(
              onPressed: onCheckIn ?? () {},
              title: "check_in_at_gym",
              iconWidget: Icon(
                Icons.location_on,
                color: R.appColors.onPrimary,
                size: 20.px,
              ),
              backgroundColor: R.appColors.primary,
              textColor: R.appColors.onPrimary,
              radius: 12,
            ),
          ],
        ),
      );
    }

    // If enrollment is closed or other states
    if (competitionStatus == "ENROLLMENT_CLOSED") {
      return DashboardWidgetHelpers.cardContainer(
        isDark: isDark,
        padding: EdgeInsets.all(4.w),
        child: Center(
          child: Text(
            "Enrollment is closed for this competition",
            style: R.textStyles.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? R.appColors.darkTextSecondary
                  : R.appColors.textSecondary,
            ),
          ),
        ),
      );
    }

    // Default: Already enrolled and submitted
    return SizedBox.shrink();
  }
}

