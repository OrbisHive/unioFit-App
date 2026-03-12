import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Info Widget
/// Displays competition basic information (dates, participants, prize)
class CompetitionInfoWidget extends StatelessWidget {
  final Map<String, dynamic> competition;
  final bool isDark;

  const CompetitionInfoWidget({
    super.key,
    required this.competition,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.calendar_today,
            label: "start_date".L(),
            value: competition["startDate"] as String? ?? "N/A",
            isDark: isDark,
          ),
          h2,
          _buildInfoRow(
            icon: Icons.event,
            label: "end_date".L(),
            value: competition["endDate"] as String? ?? "N/A",
            isDark: isDark,
          ),
          h2,
          _buildInfoRow(
            icon: Icons.people,
            label: "participants_count".L(),
            value: "${competition["participants"] ?? 0}",
            isDark: isDark,
          ),
          h2,
          _buildInfoRow(
            icon: Icons.emoji_events,
            label: "prize_amount".L(),
            value: competition["prize"] as String? ?? "N/A",
            isDark: isDark,
            valueColor: R.appColors.warning,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isDark,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24.px,
          color: isDark
              ? R.appColors.darkTextSecondary
              : R.appColors.textSecondary,
        ),
        w2,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: R.textStyles.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                ),
              ),
              SizedBox(height: 4.px),
              Text(
                value,
                style: R.textStyles.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: valueColor ??
                      (isDark
                          ? R.appColors.darkTextPrimary
                          : R.appColors.textPrimary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

