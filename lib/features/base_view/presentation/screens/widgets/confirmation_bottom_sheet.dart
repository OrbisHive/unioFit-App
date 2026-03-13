import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/utils/app_button.dart';


/// Confirmation Bottom Sheet Widget
/// Displays an attractive bottom sheet with title, subtitle, icon, and action buttons
class ConfirmationBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String? confirmText;
  final String? cancelText;
  final Color? confirmButtonColor;
  final bool isDark;

  const ConfirmationBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onConfirm,
    required this.onCancel,
    this.iconColor,
    this.confirmText,
    this.cancelText,
    this.confirmButtonColor,
    required this.isDark,
  });

  /// Shows the confirmation bottom sheet
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    Color? iconColor,
    String? confirmText,
    String? cancelText,
    Color? confirmButtonColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ConfirmationBottomSheet(
        title: title,
        subtitle: subtitle,
        icon: icon,
        iconColor: iconColor,
        onConfirm: () {
          Navigator.pop(context);
          onConfirm();
        },
        onCancel: () {
          Navigator.pop(context);
          onCancel?.call();
        },
        confirmText: confirmText,
        cancelText: cancelText,
        confirmButtonColor: confirmButtonColor,
        isDark: isDark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? R.appColors.darkSurface : R.appColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        left: 4.w,
        right: 4.w,
        top: 3.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 2.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drag handle
          Container(
            width: 40.px,
            height: 4.px,
            decoration: BoxDecoration(
              color: isDark
                  ? R.appColors.darkTextSecondary
                  : R.appColors.textSecondary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          h4,
          // Icon
          Container(
            width: 80.px,
            height: 80.px,
            decoration: BoxDecoration(
              color: (iconColor ?? R.appColors.primary)
                  .withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40.px,
              color: iconColor ?? R.appColors.primary,
            ),
          ),
          h3,
          // Title
          Text(
            title,
            style: R.textStyles.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          h2,
          // Subtitle
          Text(
            subtitle,
            style: R.textStyles.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? R.appColors.darkTextSecondary
                  : R.appColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          h4,
          // Action Buttons
          Row(
            children: [
              // Cancel Button
              Expanded(
                child: AppButton(
                  onPressed: onCancel,
                  title: cancelText ?? "Cancel",
                  isLocalizedText: false,
                  borderColor: R.appColors.darkRedColor,
                  backgroundColor: R.appColors.transparent,
                  textColor: R.appColors.darkRedColor,
                  radius: 14,
                  height: 50,
                  showOutLineBorder: true,
                ),
              ),
              w2,
              // Confirm Button
              Expanded(
                child: AppButton(
                  onPressed: onConfirm,
                  title: confirmText ?? "Confirm",
                  isLocalizedText: false,
                  backgroundColor: confirmButtonColor ?? R.appColors.primary,
                  textColor: R.appColors.onPrimary,
                  radius: 14,
                  height: 50,
                  showOutLineBorder: false,
                ),
              ),
            ],
          ),
          h2,
        ],
      ),
    );
  }
}

