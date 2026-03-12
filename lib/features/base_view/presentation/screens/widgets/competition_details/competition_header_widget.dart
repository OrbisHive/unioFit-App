import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Header Widget
/// Displays competition banner, title, and status badges
class CompetitionHeaderWidget extends StatelessWidget {
  final Map<String, dynamic> competition;
  final bool isDark;

  const CompetitionHeaderWidget({
    super.key,
    required this.competition,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final status = competition["status"] as String? ?? "ACTIVE";
    final type = competition["type"] as String? ?? "ONLINE";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner Image Placeholder
        Container(
          height: 200.px,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark
                ? R.appColors.darkSurfaceVariant
                : R.appColors.surfaceVariant,
            borderRadius: BorderRadius.circular(16),
          ),
          // child: Icon(
          //   Icons.fitness_center,
          //   size: 60.px,
          //   color: isDark
          //       ? R.appColors.darkTextSecondary
          //       : R.appColors.textSecondary,
          // ),
          child: Image.asset(R.appImages.gymReward,fit: BoxFit.cover,),
        ),
        h2,
        // Title and Badges Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                competition["title"] as String? ?? "",
                style: R.textStyles.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? R.appColors.darkTextPrimary
                      : R.appColors.textPrimary,
                ),
              ),
            ),
            w2,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBadge(type, _getTypeColor(type), isDark),
                SizedBox(height: 8.px),
                _buildBadge(status, _getStatusColor(status), isDark),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color color, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 6.px),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
          width: 1.5,
        ),
      ),
      child: Text(
        text.toLowerCase().L(),
        style: R.textStyles.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toUpperCase()) {
      case "ONLINE":
        return R.appColors.primary;
      case "OFFLINE":
        return R.appColors.success;
      default:
        return R.appColors.primary;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case "ACTIVE":
        return R.appColors.success;
      case "ENROLLMENT_CLOSED":
        return R.appColors.warning;
      case "JUDGING":
        return R.appColors.primary;
      case "ANNOUNCED":
        return R.appColors.warning;
      default:
        return R.appColors.textSecondary;
    }
  }
}

