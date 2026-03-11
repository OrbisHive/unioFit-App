import 'package:flutter/material.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import 'dashboard_widget_helpers.dart';

/// Latest Competition Announcement Widget
/// Displayed when there's no active or upcoming competition
class LatestCompetitionAnnouncement extends StatelessWidget {
  final bool isDark;

  const LatestCompetitionAnnouncement({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Announcement" label
          DashboardWidgetHelpers.styledText(
            text: "announcement".L(),
            isDark: isDark,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            isPrimary: false,
          ),
          h2,
          // Main message
          DashboardWidgetHelpers.styledText(
            text: "new_competitions_launching_soon".L(),
            isDark: isDark,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            isPrimary: true,
          ),
          h1,
          // Subtitle
          DashboardWidgetHelpers.styledText(
            text: "stay_tuned".L(),
            isDark: isDark,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            isPrimary: false,
          ),
        ],
      ),
    );
  }
}

