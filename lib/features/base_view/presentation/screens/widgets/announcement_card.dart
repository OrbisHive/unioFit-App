import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
import 'competition_type_tag.dart';
import 'dashboard_widget_helpers.dart';

/// Announcement Card Widget
/// Displayed in horizontal scrollable list
class AnnouncementCard extends StatelessWidget {
  final Map<String, dynamic> announcement;
  final bool isDark;

  const AnnouncementCard({
    super.key,
    required this.announcement,
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
          // Announcement label with emoji
          Row(
            children: [
              DashboardWidgetHelpers.emojiIcon(
                emoji: "📢",
                backgroundColor: R.appColors.primary,
                size: 14,
              ),
              w1,
              Expanded(
                child: DashboardWidgetHelpers.styledText(
                  text: "announcement".L(),
                  isDark: isDark,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  isPrimary: true,
                ),
              ),
              // Competition Type Tag (top-right) - only show if competitionType exists
              if (announcement["competitionType"] != null)
                CompetitionTypeTag(
                  type: announcement["competitionType"] as String,
                ),
            ],
          ),
          SizedBox(height: 12.px),
          // Main message with emoji
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DashboardWidgetHelpers.emojiIcon(
                emoji: "🚀",
                backgroundColor: R.appColors.success,
                size: 14,
              ),
              w1,
              Expanded(
                child: DashboardWidgetHelpers.styledText(
                  text: announcement["title"] as String,
                  isDark: isDark,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  isPrimary: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

