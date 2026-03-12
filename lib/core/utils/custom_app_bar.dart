import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../resources/resources.dart';
import 'back_button_widget.dart';

/// Custom App Bar widget for the application.
/// Provides a consistent app bar design across all screens.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onMenuPressed;
  final bool showMenuIcon;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.centerTitle = false,
    this.bottom,
    this.onMenuPressed,
    this.showMenuIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: backgroundColor ?? colorScheme.surface,
      foregroundColor: foregroundColor ?? colorScheme.onSurface,
      elevation: elevation ?? 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: centerTitle,
      leading: leading ??
          (showMenuIcon
              ? Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: isDark
                          ? R.appColors.darkTextPrimary
                          : R.appColors.textPrimary,
                    ),
                    onPressed: onMenuPressed ?? () {},
                  ),
                )
              : (showBackButton
                  ? Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: BackButtonWidget(onTap: onBackPressed),
                    )
                  : null)),
      title: title != null
          ? Text(
              title!,
              style: R.textStyles.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isDark ? R.appColors.darkTextPrimary : R.appColors.textPrimary,
                letterSpacing: 0.15,
              ),
            )
          : null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      bottom != null ? kToolbarHeight + bottom!.preferredSize.height : kToolbarHeight);
}

