import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/resources/resources.dart';

/// Helper utilities for dashboard widgets
/// Provides common styling and widget builders
class DashboardWidgetHelpers {
  /// Creates a standard card container with consistent styling
  static Widget cardContainer({
    required Widget child,
    required bool isDark,
    EdgeInsets? padding,
    double radius = 12,
  }) {
    return Container(
      padding: padding ?? EdgeInsets.all(4.w),
      decoration: R.appDecorations.generalDecoration(
        backgroundColor: isDark ? R.appColors.darkSurface : R.appColors.surface,
        radius: radius,
      ),
      child: child,
    );
  }

  /// Gets text color based on theme and text type
  static Color getTextColor({
    required bool isDark,
    required bool isPrimary,
  }) {
    return isPrimary
        ? (isDark ? R.appColors.darkTextPrimary : R.appColors.textPrimary)
        : (isDark ? R.appColors.darkTextSecondary : R.appColors.textSecondary);
  }

  /// Creates a styled text widget with common dashboard text styles
  static Widget styledText({
    required String text,
    required bool isDark,
    required double fontSize,
    required FontWeight fontWeight,
    required bool isPrimary,
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      text,
      style: R.textStyles.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: getTextColor(isDark: isDark, isPrimary: isPrimary),
      ),
      textAlign: textAlign,
    );
  }

  /// Creates an icon container with colored background
  static Widget iconContainer({
    required IconData icon,
    required Color iconColor,
    double size = 24,
    double padding = 8,
    double borderRadius = 8,
  }) {
    return Container(
      padding: EdgeInsets.all(padding.px),
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        icon,
        size: size.px,
        color: iconColor,
      ),
    );
  }

  /// Gets button text color based on theme
  static Color getButtonTextColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return colorScheme.brightness == Brightness.dark
        ? R.appColors.primary
        : R.appColors.white;
  }

  /// Creates an emoji icon container with square background
  /// Matches the style used in stat cards
  static Widget emojiIcon({
    required String emoji,
    required Color backgroundColor,
    double size = 18,
    double padding = 8,
    double borderRadius = 8,
  }) {
    return Container(
      padding: EdgeInsets.all(padding.px),
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        emoji,
        style: R.textStyles.poppins(fontSize: size),
      ),
    );
  }
}

