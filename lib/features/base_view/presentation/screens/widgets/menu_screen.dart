import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/features/base_view/presentation/screens/help_Support_view.dart';
import 'package:unio_fit/features/base_view/presentation/screens/setting_view.dart';
import '../../../../../core/constants/heights_widths.dart';
import '../../../../../core/resources/localization/localization_map.dart';
import '../../../../../core/resources/resources.dart';
import '../../profile_view.dart';
/// Menu Screen Widget for Navigation Drawer
/// Displays menu items following app theme
class MenuScreen extends StatelessWidget {
  final ZoomDrawerController? drawerController;

  const MenuScreen({
    super.key,
    this.drawerController,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = R.appColors.primary;

    return Scaffold(
      backgroundColor: isDark ? R.appColors.darkSurface : R.appColors.surface,
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? R.appColors.darkSurfaceVariant
                        : R.appColors.outline,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // App Logo or Icon
                  Container(
                    width: 50.px,
                    height: 50.px,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.fitness_center,
                      color: R.appColors.onPrimary,
                      size: 28.px,
                    ),
                  ),
                  w2,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Unio Fit",
                          style: R.textStyles.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: isDark
                                ? R.appColors.darkTextPrimary
                                : R.appColors.textPrimary,
                          ),
                        ),
                        h0P5,
                        Text(
                          "Fitness & Wellness",
                          style: R.textStyles.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: isDark
                                ? R.appColors.darkTextSecondary
                                : R.appColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            h3,
            // Menu Items
            Padding(
              padding: EdgeInsets.only(right: Get.width*0.5,left: Get.width*0.022),
              child: Column(
                children: [
                  _buildMenuItem(
                    context: context,
                    icon: Icons.dashboard_outlined,
                    title: "dashboard_screen_text".L(),
                    isDark: isDark,
                    onTap: () {
                      drawerController?.close?.call();
                    },
                  ),
                  h2,
                  _buildMenuItem(
                    context: context,
                    icon: Icons.person_outline,
                    title: "Profile",
                    isDark: isDark,
                    onTap: () {
                      // drawerController?.close?.call();
                      navigate(context, const ProfileScreen());

                    },
                  ),
                  h2,
                  _buildMenuItem(
                    context: context,
                    icon: Icons.emoji_events_outlined,
                    title: "Competitions",
                    isDark: isDark,
                    onTap: () {
                      drawerController?.close?.call();
                      // Navigation will be implemented later
                    },
                  ),
                  h2,
                  _buildMenuItem(
                    context: context,
                    icon: Icons.fitness_center_outlined,
                    title: "Gyms",
                    isDark: isDark,
                    onTap: () {
                      drawerController?.close?.call();
                      // Navigation will be implemented later
                    },
                  ),
                  h2,
                  _buildMenuItem(
                    context: context,
                    icon: Icons.settings_outlined,
                    title: "Settings",
                    isDark: isDark,
                    onTap: () {
                      // drawerController?.close?.call();
                      navigate(context, const SettingsScreen());
                    },
                  ),
                  h2,
                  _buildMenuItem(
                    context: context,
                    icon: Icons.help_outline,
                    title: "help_and_support".L(),
                    isDark: isDark,
                    onTap: () {
                      // drawerController?.close?.call();
                      navigate(context, const HelpSupportScreen());
                      //
                    },
                  ),
                  h4,
                  // Footer Section
                  Container(
                    // padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: R.appColors.error,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: _buildMenuItem(
                      context: context,
                      showIcon: false,
                      icon: Icons.logout_outlined,
                      title: "Logout",
                      isDark: isDark,
                      iconColor: R.appColors.white,
                      textColor: R.appColors.white,
                      onTap: () {
                        drawerController?.close?.call();
                        // Logout logic will be implemented later
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void navigate(BuildContext context, Widget page) {
    drawerController?.close?.call();
    Future.delayed(const Duration(milliseconds: 250), () {
      Get.to(() => page);
    });
  }
  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool isDark,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
    bool? showIcon=true,
  }) {
    final defaultIconColor = iconColor ??
        (isDark ? R.appColors.darkTextPrimary : R.appColors.textPrimary);
    final defaultTextColor = textColor ??
        (isDark ? R.appColors.darkTextPrimary : R.appColors.textPrimary);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.px, horizontal: 4.px),
        child: Row(
          children: [
            Icon(
              icon,
              color: defaultIconColor,
              size: 24.px,
            ),
            w2,
            Expanded(
              child: Text(
                title,
                style: R.textStyles.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: defaultTextColor,
                ),
              ),
            ),
           w1,
           if(showIcon==true) Icon(
              Icons.chevron_right,
              color: isDark
                  ? R.appColors.darkTextSecondary
                  : R.appColors.textSecondary,
              size: 20.px,
            ),
          ],
        ),
      ),
    );
  }
}

