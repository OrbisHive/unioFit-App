import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unio_fit/features/auth/presentation/screens/registration_screen.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/app_button.dart';

/// Onboarding screen with 3-step introduction.
class OnboardingScreen extends StatefulWidget {
 static String route = '/onboarding';
   const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      icon: Icons.fitness_center,
      title: "Discover Gyms Near You",
      subtitle: "Find the best gyms with ratings, photos & directions",
    ),
    OnboardingPage(
      icon: Icons.emoji_events,
      title: "Join Exciting Competitions",
      subtitle: "Challenge yourself and win real cash or prizes",
    ),
    OnboardingPage(
      icon: Icons.military_tech, // Using military_tech as trophy alternative
      title: "Track Your Wins & Rewards",
      subtitle: "See winners, claim prizes, and stay motivated",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToNameEntry();
    }
  }

  void _skip() {
    _goToNameEntry();
  }

  void _goToNameEntry() {
    Get.offNamed(RegistrationScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // PageView with onboarding pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index], colorScheme);
                },
              ),
            ),
            // Bottom section with dots and buttons
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => _buildDot(index == _currentPage, colorScheme),
                    ),
                  ),
                  h4,
                  // Skip and Next buttons
                  Row(
                    children: [
                      // Skip button
                      Expanded(
                        child: AppButton(
                          onPressed: _skip,
                          title: "Skip",
                          isLocalizedText: false,
                          backgroundColor: Colors.transparent,
                          textColor:colorScheme.brightness==Brightness.dark? R.appColors.primary : R.appColors.white,
                          fullWidth: false,
                          height: 50,
                        ),
                      ),
                      w2,
                      // Next / Get Started button
                      Expanded(
                        flex: 2,
                        child: AppButton(
                          onPressed: _nextPage,
                          title: _currentPage == _pages.length - 1
                              ? "Get Started"
                              : "Next",
                          isLocalizedText: false,
                          textSize: 16,
                          textColor:colorScheme.brightness==Brightness.dark? R.appColors.primary : R.appColors.white,
                          backgroundColor: Colors.transparent,
                          textWeight: FontWeight.w600,
                          height: 50,
                          radius: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration / Icon
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              page.icon,
              size: 100,
              color: colorScheme.primary,
            ),
          ),
          h6,
          // Title
          Text(
            page.title,
            style: R.textStyles.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          h3,
          // Subtitle
          Text(
            page.subtitle,
            style: R.textStyles.poppins(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive, ColorScheme colorScheme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ?colorScheme.brightness==Brightness.dark?colorScheme.secondary:colorScheme.primary
            : colorScheme.onSurfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

/// Data class for onboarding page content.
class OnboardingPage {
  final IconData icon;
  final String title;
  final String subtitle;

  OnboardingPage({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

