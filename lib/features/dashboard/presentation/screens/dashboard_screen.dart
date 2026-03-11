import 'package:flutter/material.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
/// Dashboard screen (placeholder).
/// Will be fully implemented in future user stories.
class DashboardScreen extends StatelessWidget {
  static String route = '/dashboard';
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dashboard".L()),
      ),
      body: Center(
        child: Text(
          "${"dashboard_screen_text".L()}\n\n${"this_screen_will_be_implemented".L()}",
          textAlign: TextAlign.center,
          style: R.textStyles.poppins(
            fontSize: 16,
            color: R.appColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

