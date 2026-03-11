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
      backgroundImage: R.appImages.descoverGym,
    ),
    OnboardingPage(
      title: "Join Exciting Competitions",
      subtitle: "Challenge yourself and win real cash or prizes",
      backgroundImage: R.appImages.gymCompetition,
    ),
    OnboardingPage(
      title: "Track Your Wins & Rewards",
      subtitle: "See winners, claim prizes, and stay motivated",
      backgroundImage: R.appImages.gymReward,
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
      body: Stack(
        children: [
          /// FULL SCREEN BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              _pages[_currentPage].backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _buildPage(_pages[index]);
                    },
                  ),
                ),

                /// BOTTOM SECTION
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      /// DOTS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                              (index) => _buildDot(index == _currentPage, colorScheme),
                        ),
                      ),
                      h4,

                      /// BUTTONS
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              onPressed: _skip,
                              title: "Skip",
                              isLocalizedText: false,
                              backgroundColor: Colors.transparent,
                              textColor: Colors.black,
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
                              textColor: Colors.black,
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
        ],
      ),
    );
  }

  /// PAGE CONTENT
  Widget _buildPage(OnboardingPage page) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    );
  }

  /// DOTS
  Widget _buildDot(bool isActive, ColorScheme colorScheme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white
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