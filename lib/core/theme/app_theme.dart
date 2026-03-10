import 'package:flutter/material.dart';
import '../resources/resources.dart';

/// Application theme configuration.
/// Provides light and dark theme variants using Material 3 design system.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  /// Light theme configuration
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: R.appColors.primary,
      brightness: Brightness.light,
      primary: R.appColors.primary,
      onPrimary: R.appColors.onPrimary,
      primaryContainer: R.appColors.primaryContainer,
      onPrimaryContainer: R.appColors.onPrimaryContainer,
      secondary: R.appColors.secondary,
      onSecondary: R.appColors.onSecondary,
      secondaryContainer: R.appColors.secondaryContainer,
      onSecondaryContainer: R.appColors.onSecondaryContainer,
      error: R.appColors.error,
      onError: R.appColors.onError,
      errorContainer: R.appColors.errorContainer,
      onErrorContainer: R.appColors.onErrorContainer,
      surface: R.appColors.surface,
      onSurface: R.appColors.onSurface,
      surfaceContainerHighest: R.appColors.surfaceVariant,
      onSurfaceVariant: R.appColors.onSurfaceVariant,
      // background and onBackground are deprecated, using surface instead
      outline: R.appColors.outline,
      outlineVariant: R.appColors.outlineVariant,
    ),
    scaffoldBackgroundColor: R.appColors.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: R.appColors.surface,
      foregroundColor: R.appColors.onSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: R.textStyles.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0.15,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: R.appColors.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      color: R.appColors.surface,
      surfaceTintColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: R.appColors.primary, // #060813 for light mode buttons
        foregroundColor: R.appColors.onPrimary, // White text on primary buttons
        textStyle: R.textStyles.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: R.appColors.outline,
          width: 1.5,
        ),
        foregroundColor: R.appColors.primary,
        textStyle: R.textStyles.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        foregroundColor: R.appColors.primary,
        textStyle: R.textStyles.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: R.appColors.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.outline,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.outline,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.error,
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    dividerTheme: DividerThemeData(
      color: R.appColors.divider,
      thickness: 1,
      space: 1,
    ),
    textTheme: TextTheme(
      displayLarge: R.textStyles.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: R.appColors.textPrimary,
        letterSpacing: -0.25,
      ),
      displayMedium: R.textStyles.poppins(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: R.appColors.textPrimary,
        letterSpacing: 0,
      ),
      displaySmall: R.textStyles.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: R.appColors.textPrimary,
        letterSpacing: 0,
      ),
      headlineLarge: R.textStyles.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0,
      ),
      headlineMedium: R.textStyles.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0,
      ),
      headlineSmall: R.textStyles.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0,
      ),
      titleLarge: R.textStyles.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0,
      ),
      titleMedium: R.textStyles.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0.15,
      ),
      titleSmall: R.textStyles.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0.1,
      ),
      bodyLarge: R.textStyles.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: R.appColors.textPrimary,
        letterSpacing: 0.5,
      ),
      bodyMedium: R.textStyles.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: R.appColors.textPrimary,
        letterSpacing: 0.25,
      ),
      bodySmall: R.textStyles.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: R.appColors.textSecondary,
        letterSpacing: 0.4,
      ),
      labelLarge: R.textStyles.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0.1,
      ),
      labelMedium: R.textStyles.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: R.appColors.textPrimary,
        letterSpacing: 0.5,
      ),
      labelSmall: R.textStyles.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: R.appColors.textSecondary,
        letterSpacing: 0.5,
      ),
    ),
  );

  /// Dark theme configuration
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: R.appColors.primary, // #060813 for dark mode background
      onPrimary: R.appColors.onPrimary, // White text on primary
      primaryContainer: R.appColors.primaryContainer,
      onPrimaryContainer: R.appColors.onPrimaryContainer,
      secondary: R.appColors.secondary, // White for dark mode buttons
      onSecondary: R.appColors.onSecondary, // #060813 text on white - explicitly set
      secondaryContainer: R.appColors.secondaryContainer,
      onSecondaryContainer: R.appColors.onSecondaryContainer,
      error: R.appColors.error,
      onError: R.appColors.onError,
      errorContainer: const Color(0xFFDC2626), // Red-600
      onErrorContainer: R.appColors.errorContainer,
      surface: R.appColors.darkSurface,
      onSurface: R.appColors.darkOnSurface,
      surfaceContainerHighest: R.appColors.darkSurfaceVariant,
      onSurfaceVariant: R.appColors.darkTextSecondary,
      // background and onBackground are deprecated, using surface instead
      outline: R.appColors.darkSurfaceVariant,
      outlineVariant: R.appColors.darkSurfaceVariant,
    ),
    scaffoldBackgroundColor: R.appColors.primary, // #060813 for dark mode background
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: R.appColors.darkSurface,
      foregroundColor: R.appColors.darkOnSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: R.textStyles.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.15,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: R.appColors.darkSurfaceVariant.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      color: R.appColors.darkSurface,
      surfaceTintColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: R.appColors.secondary, // White buttons in dark mode
        foregroundColor: R.appColors.onSecondary, // #060813 text on white buttons
        textStyle: R.textStyles.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: R.appColors.onSecondary, // Explicitly set text color to #060813
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: R.appColors.darkSurfaceVariant,
          width: 1.5,
        ),
        foregroundColor: R.appColors.primary,
        textStyle: R.textStyles.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        foregroundColor: R.appColors.primary,
        textStyle: R.textStyles.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: R.appColors.darkSurfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.darkSurfaceVariant,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.darkSurfaceVariant,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: R.appColors.error,
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    dividerTheme: DividerThemeData(
      color: R.appColors.darkSurfaceVariant,
      thickness: 1,
      space: 1,
    ),
    textTheme: TextTheme(
      displayLarge: R.textStyles.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: R.appColors.darkTextPrimary,
        letterSpacing: -0.25,
      ),
      displayMedium: R.textStyles.poppins(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0,
      ),
      displaySmall: R.textStyles.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0,
      ),
      headlineLarge: R.textStyles.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0,
      ),
      headlineMedium: R.textStyles.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0,
      ),
      headlineSmall: R.textStyles.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0,
      ),
      titleLarge: R.textStyles.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0,
      ),
      titleMedium: R.textStyles.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.15,
      ),
      titleSmall: R.textStyles.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.1,
      ),
      bodyLarge: R.textStyles.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.5,
      ),
      bodyMedium: R.textStyles.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.25,
      ),
      bodySmall: R.textStyles.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: R.appColors.darkTextSecondary,
        letterSpacing: 0.4,
      ),
      labelLarge: R.textStyles.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.1,
      ),
      labelMedium: R.textStyles.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextPrimary,
        letterSpacing: 0.5,
      ),
      labelSmall: R.textStyles.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: R.appColors.darkTextSecondary,
        letterSpacing: 0.5,
      ),
    ),
  );
}

