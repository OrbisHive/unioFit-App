import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unio_fit/features/auth/presentation/screens/registration_screen.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/app_button.dart';
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
      title: "Discover Gyms Near You",
      subtitle: "Find the best gyms with ratings, photos & directions",
      backgroundImage: R.appImages.descoverGym
    ),
    OnboardingPage(
      title: "Join Exciting Competitions",
      subtitle: "Challenge yourself and win real cash or prizes",
      backgroundImage: R.appImages.gymCompetition
    ),
    OnboardingPage(
      title: "Track Your Wins & Rewards",
      subtitle: "See winners, claim prizes, and stay motivated",
      backgroundImage: R.appImages.gymReward
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

            // Bottom section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                          (index) => _buildDot(index == _currentPage, colorScheme),
                    ),
                  ),
                  h4,

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: _skip,
                          title: "Skip",
                          isLocalizedText: false,
                          backgroundColor: Colors.transparent,
                          textColor: colorScheme.brightness == Brightness.dark
                              ? R.appColors.primary
                              : R.appColors.white,
                          height: 50,
                        ),
                      ),
                      w2,
                      Expanded(
                        flex: 2,
                        child: AppButton(
                          onPressed: _nextPage,
                          title: _currentPage == _pages.length - 1
                              ? "Get Started"
                              : "Next",
                          isLocalizedText: false,
                          textSize: 16,
                          textColor: colorScheme.brightness == Brightness.dark
                              ? R.appColors.primary
                              : R.appColors.white,
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

  /// FULL SCREEN PAGE WITHOUT ICON
  Widget _buildPage(OnboardingPage page, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(page.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),

      // Dark overlay
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Text(
              page.title,
              style: R.textStyles.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            h3,

            // Subtitle
            Text(
              page.subtitle,
              style: R.textStyles.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// DOTS
  Widget _buildDot(bool isActive, ColorScheme colorScheme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? (colorScheme.brightness == Brightness.dark
            ? colorScheme.secondary
            : colorScheme.primary)
            : Colors.white54,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final String backgroundImage;

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.backgroundImage,
  });
}