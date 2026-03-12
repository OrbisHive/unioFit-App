import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Prize Widget
/// Displays prize information
class CompetitionPrizeWidget extends StatelessWidget {
  final Map<String, dynamic> competition;
  final bool isDark;

  const CompetitionPrizeWidget({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "prize_information".L(),
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h3,
          _buildPrizeRow(
            emoji: "🏆",
            label: "grand_prize".L(),
            amount: competition["grandPrize"] as String? ??
                competition["prize"] as String? ??
                "N/A",
            isDark: isDark,
          ),
          h2,
          _buildPrizeRow(
            emoji: "🥈",
            label: "runner_up".L(),
            amount: competition["runnerUp"] as String? ?? "N/A",
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildPrizeRow({
    required String emoji,
    required String label,
    required String amount,
    required bool isDark,
  }) {
    return Row(
      children: [
        Text(
          emoji,
          style: R.textStyles.poppins(fontSize: 24),
        ),
        w2,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: R.textStyles.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                ),
              ),
              SizedBox(height: 4.px),
              Text(
                amount,
                style: R.textStyles.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: R.appColors.warning,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

