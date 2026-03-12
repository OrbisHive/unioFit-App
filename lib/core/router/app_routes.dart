import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unio_fit/features/base_view/presentation/screens/base_view.dart';
import '../../features/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/screens/registration_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/terms_and_privacy_view.dart';
import '../../features/base_view/presentation/screens/active_competitions_view_all_screen.dart';
import '../../features/base_view/presentation/screens/announcements_view_all_screen.dart';
import '../../features/base_view/presentation/screens/competition_details_screen.dart';
import '../../features/base_view/presentation/screens/dashboard_screen.dart';
import '../../features/base_view/presentation/screens/upcoming_competitions_view_all_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';

/// Application routes configuration using GetX.
/// Centralizes all route definitions and navigation logic.
abstract class AppRoutes {
  /// List of all GetX routes
  static final List<GetPage> pages = [
    GetPage(
      name: SplashScreen.route,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: OnboardingScreen.route,
      page: () => const OnboardingScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RegistrationScreen.route,
      page: () {
        // Extract pre-filled phone number from arguments if available
        final phoneNumber = Get.arguments?['phoneNumber'] as String?;
        return RegistrationScreen(preFilledPhoneNumber: phoneNumber);
      },
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: OtpVerificationScreen.route,
      page: () => const OtpVerificationScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: BaseView.route,
      page: () => const BaseView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),GetPage(
      name: DashboardScreen.route,
      page: () => const DashboardScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: TermsAndPolicyView.route,
      page: () => const TermsAndPolicyView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: ActiveCompetitionsViewAllScreen.route,
      page: () => const ActiveCompetitionsViewAllScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: UpcomingCompetitionsViewAllScreen.route,
      page: () => const UpcomingCompetitionsViewAllScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AnnouncementsViewAllScreen.route,
      page: () => const AnnouncementsViewAllScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: CompetitionDetailsScreen.route,
      page: () => const CompetitionDetailsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
