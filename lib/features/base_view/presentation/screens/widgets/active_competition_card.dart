import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/utils/helper.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
import '../competition_details_screen.dart';
import 'competition_type_tag.dart';
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
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          CompetitionDetailsScreen.route,
          arguments: {
            ...competition,
            "type": "ONLINE",
            "status": "ACTIVE",
          },
        );
      },
      child: DashboardWidgetHelpers.cardContainer(
        isDark: isDark,
        padding: EdgeInsets.all(8.px),
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
                  size: 14,
                ),
                w1,
                Expanded(
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    competition["title"] as String,
                    style: R.textStyles.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: DashboardWidgetHelpers.getTextColor(isDark: isDark, isPrimary: true),
                    ),
                  ),
                ),
                CompetitionTypeTag(
                  type: competition["competitionType"] as String? ?? "ONLINE",
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
                Get.toNamed(
                  CompetitionDetailsScreen.route,
                  arguments: {
                    ...competition,
                    "type": competition["competitionType"] as String? ?? "ONLINE",
                    "status": "ACTIVE",
                  },
                );
              },
              icon: Icons.local_fire_department,
              title: "enroll_now",
            ),
          ],
        ),
      ),
    );
  }
}

