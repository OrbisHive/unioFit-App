import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/resources.dart';
import 'dashboard_widget_helpers.dart';

/// Dashboard Header Widget
/// Displays greeting text and user name with emoji
class DashboardHeader extends StatelessWidget {
  final String userName;
  final String userGreeting;
  final String? profileImageUrl;
  final bool isDark;

  const DashboardHeader({
    super.key,
    required this.userName,
    required this.userGreeting,
    this.profileImageUrl,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Greeting text
        DashboardWidgetHelpers.styledText(
          text: "$userGreeting,",
          isDark: isDark,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          isPrimary: false,
        ),
        h0P5,
        // User name with emoji
        Row(
          children: [
            DashboardWidgetHelpers.styledText(
              text: "$userName 👋",
              isDark: isDark,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              isPrimary: true,
            ),
            // Optional profile avatar
            if (profileImageUrl != null) ...[
              w2,
              Container(
                width: 40.px,
                height: 40.px,
                decoration: BoxDecoration(
                  color: R.appColors.primaryContainer,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profileImageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

