import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';

/// Enhanced Enroll Button Widget
/// Custom button with gradient background, icon, and modern styling
class EnhancedEnrollButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String title;
  final bool isLocalizedText;

  const EnhancedEnrollButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.local_fire_department,
    this.title = "enroll_now",
    this.isLocalizedText = true,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = R.appColors.primary;
    // Create a slightly darker shade for gradient end
    // For dark primary color (#060813), create a darker variation
    final gradientEndColor = Color.fromRGBO(
      (primaryColor.red * 0.7).round().clamp(0, 255),
      (primaryColor.green * 0.7).round().clamp(0, 255),
      (primaryColor.blue * 0.8).round().clamp(0, 255),
      1.0,
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Material(
        borderRadius: BorderRadius.circular(14),
        elevation: 2,
        shadowColor: primaryColor.withValues(alpha: 0.3),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  gradientEndColor,
                ],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12.px,
              horizontal: 16.px,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 18.px,
                  color: R.appColors.onPrimary,
                ),
                SizedBox(width: 6.px),
                Text(
                  isLocalizedText ? title.L() : title,
                  style: R.textStyles.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: R.appColors.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

