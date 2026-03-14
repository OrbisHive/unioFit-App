import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/constants/heights_widths.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';
import 'package:unio_fit/core/utils/custom_app_bar.dart';
import '../../../../core/resources/resources.dart';
import 'delete_Account.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool comp = true;
  bool announce = true;
  bool winners = true;
  bool account = true;

  bool isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings-lbl".L(),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          /// Notifications
          Text(
            "Notification_title".L(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          SwitchListTile(
            value: comp,
            title: Text(
              "Competition_Updates".L(),
              style: R.textStyles.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? R.appColors.white : R.appColors.primary,
              ),
            ),
            onChanged: (v) => setState(() => comp = v),
          ),

          SwitchListTile(
            value: announce,
            title: Text(
              "Announcements_lbl".L(),
              style: R.textStyles.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? R.appColors.white : R.appColors.primary,
              ),
            ),
            onChanged: (v) => setState(() => announce = v),
          ),

          SwitchListTile(
            value: winners,
            title: Text(
              "Winner_Notifications".L(),
              style: R.textStyles.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? R.appColors.white : R.appColors.primary,
              ),
            ),
            onChanged: (v) => setState(() => winners = v),
          ),

          h1,

          /// Theme Settings
          Text(
            "Appearance_lbl".L(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          SwitchListTile(
            value: isDarkMode,
            title: Text(
              "Dark_Mode".L(),
              style: R.textStyles.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? R.appColors.white : R.appColors.primary,
              ),
            ),
            onChanged: (value) {

              setState(() {
                isDarkMode = value;
              });

              if (value) {
                Get.changeThemeMode(ThemeMode.dark);
              } else {
                Get.changeThemeMode(ThemeMode.light);
              }

            },
          ),

          h1,

          /// Account
          Text(
            "Account_Setting".L(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          h1,

          _tile("Delete_Account".L(), isDark),

        ],
      ),
    );
  }

  Widget _tile(String title, bool isDark) {

    return ListTile(

      title: Text(
        title,
        style: R.textStyles.poppins(
          fontSize: 15.5.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? R.appColors.white : R.appColors.primary,
        ),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: isDark ? R.appColors.white : Colors.grey,
      ),

      onTap: () {
        Get.to(() => DeleteAccountScreen());
      },
    );
  }
}