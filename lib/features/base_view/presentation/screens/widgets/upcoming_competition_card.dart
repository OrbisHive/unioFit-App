import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
import '../competition_details_screen.dart';
import 'competition_type_tag.dart';
import 'dashboard_widget_helpers.dart';

/// Upcoming Competition Card Widget
/// Simple card showing upcoming competition with countdown
class UpcomingCompetitionCard extends StatelessWidget {
  final Map<String, dynamic> competition;
  final bool isDark;

  const UpcomingCompetitionCard({
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
            "type": competition["competitionType"] as String? ?? "ONLINE",
            "status": "ACTIVE",
            "prize": "Rs 10,000",
            "participants": 0,
          },
        );
      },
      child: DashboardWidgetHelpers.cardContainer(
        isDark: isDark,
        padding: EdgeInsets.all(16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Competition title with emoji
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DashboardWidgetHelpers.emojiIcon(
                  emoji: "⏳",
                  backgroundColor: R.appColors.primary,
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
                ),                // Competition Type Tag (top-right)
                if (competition["competitionType"] != null)
                  CompetitionTypeTag(
                    type: competition["competitionType"] as String,
                  ),
              ],
            ),
            SizedBox(height: 12.px),
            // "Starts in X days" countdown with emoji
            Row(
              children: [
                DashboardWidgetHelpers.emojiIcon(
                  emoji: "📅",
                  backgroundColor: R.appColors.primary,
                  size: 14,
                ),
                w1,
                DashboardWidgetHelpers.styledText(
                  text: "${"starts_in".L()} ${competition["startsIn"] as String}",
                  isDark: isDark,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  isPrimary: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

