import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
import 'dashboard_widget_helpers.dart';
import 'enhanced_enroll_button.dart';

/// Active Competition Card Widget
class ActiveCompetitionCard extends StatelessWidget {
  final Map<String, dynamic> competition;
  final bool isDark;

  const ActiveCompetitionCard({
    super.key,
    required this.competition,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(16.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Active Badge and Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DashboardWidgetHelpers.emojiIcon(
                emoji: "🔥",
                backgroundColor: R.appColors.error,
                size: 18,
              ),
              w1,
              Expanded(
                child: DashboardWidgetHelpers.styledText(
                  text: competition["title"] as String,
                  isDark: isDark,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  isPrimary: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.px),
          // Prize and Participants Row
          Row(
            children: [
              // Prize
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DashboardWidgetHelpers.emojiIcon(
                    emoji: "🏆",
                    backgroundColor: R.appColors.warning,
                    size: 14,
                  ),
                  w1,
                  Flexible(
                    child: Text(
                      "Prize: ${competition["prize"] as String}",
                      style: R.textStyles.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: R.appColors.warning,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              w3,
              // Participants
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DashboardWidgetHelpers.emojiIcon(
                    emoji: "👥",
                    backgroundColor: R.appColors.primary,
                    size: 14,
                  ),
                  w1,
                  Flexible(
                    child: DashboardWidgetHelpers.styledText(
                      text: "${competition["participants"]} Joined",
                      isDark: isDark,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      isPrimary: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.px),
          // Enroll Now Button
          EnhancedEnrollButton(
            onPressed: () {
              // Navigation will be implemented later
            },
            icon: Icons.local_fire_department,
            title: "enroll_now",
          ),
        ],
      ),
    );
  }
}

