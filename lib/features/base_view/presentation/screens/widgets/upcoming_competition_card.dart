import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
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
    return DashboardWidgetHelpers.cardContainer(
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
    );
  }
}

