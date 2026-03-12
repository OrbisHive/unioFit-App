import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';

import '../../../../../core/resources/resources.dart';


/// Competition Type Tag Widget
/// Displays ONLINE or OFFLINE badge with appropriate styling
class CompetitionTypeTag extends StatelessWidget {
  final String type; // "ONLINE" or "OFFLINE"

  const CompetitionTypeTag({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isOnline = type.toUpperCase() == "ONLINE";
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.px, vertical: 4.px),
      decoration: BoxDecoration(
        color: (isOnline ? R.appColors.success : R.appColors.warning)
            .withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isOnline ? R.appColors.success : R.appColors.warning,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isOnline ? "🌐" : "📍",
            style: R.textStyles.poppins(fontSize: 12),
          ),
          SizedBox(width: 4.px),
          Text(
            isOnline ? "online".L() : "offline".L(),
            style: R.textStyles.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: isOnline ? R.appColors.success : R.appColors.warning,
            ),
          ),
        ],
      ),
    );
  }
}

