import 'package:flutter/material.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/app_button.dart';

/// Home screen placeholder.
/// This screen demonstrates the Clean Architecture + Riverpod setup is working.
class HomeScreen extends StatelessWidget {
  static String route = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("clean_architecture_ready".L()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "clean_architecture_ready".L(),
              style: R.textStyles.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.appColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppButton(
              onPressed: () {
                // Placeholder button - functionality will be added later
              },
              title: "placeholder_button",
              fullWidth: false,
            ),
          ],
        ),
      ),
    );
  }
}

