import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';

/// Dashboard Stats Widget
/// Displays Total Winners and Total Cash Distributed
class DashboardStats extends StatelessWidget {
  final bool isDark;
  
  // Mock data - will be replaced with real data later
  final int totalWinners = 245;
  final String totalCashDistributed = "Rs 12,500";

  const DashboardStats({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            title: "total_winners".L(),
            value: totalWinners.toString(),
            emoji: "🏆",
            backgroundColor: R.appColors.warning,
            isDark: isDark,
          ),
        ),
        SizedBox(width: 12.px),
        Expanded(
          child: StatCard(
            title: "total_cash_distributed".L(),
            value: totalCashDistributed,
            emoji: "💰",
            backgroundColor: R.appColors.success,
            isDark: isDark,
          ),
        ),
      ],
    );
  }
}

/// Individual stat card widget
/// Enhanced card with emoji icon, title and large value
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String emoji;
  final Color backgroundColor;
  final bool isDark;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.emoji,
    required this.backgroundColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = R.appColors.primary;
    final cardBackgroundColor = isDark 
        ? R.appColors.darkSurface 
        : R.appColors.surface;
    
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        // Background tint using primary color with low opacity
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cardBackgroundColor,
            primaryColor.withValues(alpha: 0.05),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Emoji Icon in square container
          Container(
            width: 40.px,
            height: 40.px,
            decoration: BoxDecoration(
              color: backgroundColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                emoji,
                style: R.textStyles.poppins(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 10.px),
          // Title text
          Text(
            title,
            style: R.textStyles.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isDark 
                  ? R.appColors.darkTextSecondary 
                  : R.appColors.textSecondary,
            ),
          ),
          SizedBox(height: 10.px),
          // Large value
          Text(
            value,
            style: R.textStyles.poppins(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: isDark 
                  ? R.appColors.darkTextPrimary 
                  : R.appColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

