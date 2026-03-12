import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/constants/heights_widths.dart';
import '../../../../../../core/resources/localization/localization_map.dart';
import '../../../../../../core/resources/resources.dart';
import '../dashboard_widget_helpers.dart';

/// Competition Description Widget
/// Displays competition description with expandable text
class CompetitionDescriptionWidget extends StatefulWidget {
  final String description;
  final bool isDark;

  const CompetitionDescriptionWidget({
    super.key,
    required this.description,
    required this.isDark,
  });

  @override
  State<CompetitionDescriptionWidget> createState() =>
      _CompetitionDescriptionWidgetState();
}

class _CompetitionDescriptionWidgetState
    extends State<CompetitionDescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final shouldShowExpand = widget.description.length > 150;

    return DashboardWidgetHelpers.cardContainer(
      isDark: widget.isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "description".L(),
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: widget.isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h2,
          Text(
            _isExpanded || !shouldShowExpand
                ? widget.description
                : "${widget.description.substring(0, 150)}...",
            style: R.textStyles.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: widget.isDark
                  ? R.appColors.darkTextSecondary
                  : R.appColors.textSecondary,
            ),
          ),
          if (shouldShowExpand) ...[
            h1,
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(
                _isExpanded ? "Show Less" : "Show More",
                style: R.textStyles.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: R.appColors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

