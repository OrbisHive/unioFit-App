// TODO: Replace these placeholder colors with final brand palette later

import 'package:flutter/material.dart';

/// Central color definitions for the application.
/// All colors used throughout the app should reference this class.
/// Colors are designed to work in both light and dark themes.
class AppColors {
  AppColors(); // Private ructor to prevent instantiation

  // Primary colors
    Color primary = Color(0xFF060813); // Brand color (dark blue/black)
    Color primaryContainer = Color(0xFFE0E7FF); // Light container
    Color onPrimary = Color(0xFFFFFFFF); // White text on primary
    Color onPrimaryContainer = Color(0xFF060813); // Dark text on light container

  // Secondary colors
    Color secondary = Color(0xFFFFFFFF); // White
    Color secondaryContainer = Color(0xFFF3F4F6); // Light gray container
    Color onSecondary = Color(0xFF060813); // Dark text on white secondary
    Color onSecondaryContainer = Color(0xFF111827); // Dark text on light container

  // Background & Surface colors
    Color background = Color(0xFFFAFAFA); // Gray-50
    Color onBackground = Color(0xFF1F2937); // Gray-800
    Color surface = Color(0xFFFFFFFF); // White
    Color surfaceVariant = Color(0xFFF3F4F6); // Gray-100
    Color onSurface = Color(0xFF111827); // Gray-900
    Color onSurfaceVariant = Color(0xFF6B7280); // Gray-500

  // Text colors
    Color textPrimary = Color(0xFF111827); // Gray-900
    Color textSecondary = Color(0xFF6B7280); // Gray-500
    Color textTertiary = Color(0xFF9CA3AF); // Gray-400
    Color textDisabled = Color(0xFFD1D5DB); // Gray-300

  // Error colors
    Color error = Color(0xFFEF4444); // Red-500
    Color errorContainer = Color(0xFFFEE2E2); // Red-100
    Color onError = Color(0xFFFFFFFF); // White
    Color onErrorContainer = Color(0xFF991B1B); // Red-800

  // Success colors
    Color success = Color(0xFF10B981); // Emerald-500
    Color successContainer = Color(0xFFD1FAE5); // Emerald-100
    Color onSuccess = Color(0xFFFFFFFF); // White
    Color onSuccessContainer = Color(0xFF065F46); // Emerald-800

  // Warning colors
    Color warning = Color(0xFFF59E0B); // Amber-500
    Color warningContainer = Color(0xFFFEF3C7); // Amber-100
    Color onWarning = Color(0xFF111827); // Gray-900
    Color onWarningContainer = Color(0xFF92400E); // Amber-800

  // Outline & Divider colors
    Color outline = Color(0xFFE5E7EB); // Gray-200
    Color outlineVariant = Color(0xFFF3F4F6); // Gray-100
    Color divider = Color(0xFFE5E7EB); // Gray-200

  // Dark theme variants (optimized for good contrast)
    Color darkBackground = Color(0xFF121212); // Material Dark background
    Color darkSurface = Color(0xFF1E1E1E); // Material Dark surface
    Color darkSurfaceVariant = Color(0xFF2C2C2C); // Slightly lighter for variants
    Color darkOnSurface = Color(0xFFE0E0E0); // Light text on dark
    Color darkTextPrimary = Color(0xFFE0E0E0); // Primary text color
    Color darkTextSecondary = Color(0xFFB0B0B0); // Secondary text color

  Color black = const Color(0xff000000);
  Color white = const Color(0xffFFFFFF);
  Color red = const Color(0xffE90000);
  Color greyColor = const Color(0xFF8A94A4);
  Color lightGreenColor = const Color(0xffF6FFF9);
  Color greenToast = const Color(0xff05A660);
  Color redToast = const Color(0xffFFE5E5);
  Color darkRedColor = const Color(0xffFF3B3B);
  Color splashBackgroundColor = Color(0xff1C1C28);
  Color transparent = Colors.transparent;
  Color borderColor = const Color(0xffE8ECF4);
  Color lightGreyCheckBGColor = const Color(0xffE5E4E3);
  Color pinFieldActiveBorderColor = const Color(0xff0E0E0E);
  Color pinFieldBGColor = const Color(0xffF7F8F9);
  Color buttonColorDark = const Color(0xff0F0F0F);

  Color bgCardGreyColor = const Color(0xffF7F8FC);


}

