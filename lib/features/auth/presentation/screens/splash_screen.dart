import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unio_fit/features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/router/app_routes.dart';

/// Splash screen that shows branded logo and tagline for 2 seconds,
/// then redirects to onboarding.
class SplashScreen extends StatefulWidget {
  static String route = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds, then go to onboarding
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Get.offNamed(OnboardingScreen.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Use logoLight for light mode, logoDark for dark mode
    final logoPath = isDarkMode ? R.appImages.logoDark : R.appImages.logoLight;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo (theme-aware)
              Image.asset(
                logoPath,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              // App name
              Text(
                "app_name".L(),
                style: R.textStyles.poppins(
                  fontSize: 28,
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Tagline
              Text(
                "splash_tagline".L(),
                style: R.textStyles.poppins(
                  fontSize: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              // Loading indicator
              CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
