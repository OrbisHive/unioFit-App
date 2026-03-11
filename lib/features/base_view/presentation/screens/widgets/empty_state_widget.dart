import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';

/// Empty State Widget for when there's no competition
class EmptyStateWidget extends StatelessWidget {
  final bool isDark;

  const EmptyStateWidget({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      decoration: R.appDecorations.generalDecoration(
        backgroundColor: isDark ? R.appColors.darkSurface : R.appColors.surface,
        radius: 12,
      ),
      child: Column(
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 64.px,
            color: isDark ? R.appColors.darkTextSecondary : R.appColors.textSecondary,
          ),
          h3,
          Text(
            "no_competitions_available".L(),
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? R.appColors.darkTextPrimary : R.appColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          h2,
          Text(
            "no_competitions_description".L(),
            style: R.textStyles.poppins(
              fontSize: 14,
              color: isDark ? R.appColors.darkTextSecondary : R.appColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

