import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/dashboard_stats.dart';
import 'widgets/active_competition_card.dart';
import 'widgets/upcoming_competition_card.dart';
import 'widgets/announcement_card.dart';
import 'widgets/empty_dashboard_state.dart';

/// Dashboard screen - US-005 Dashboard Load
/// Frontend only implementation with mock/static data
class DashboardScreen extends StatefulWidget {
  static String route = '/dashboard';
  final ZoomDrawerController? drawerController;

  const DashboardScreen({
    super.key,
    this.drawerController,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Mock data - will be replaced with real data later
  final String _userName = "Umair";
  final String _userGreeting = "Good Morning";
  
  // Mock lists for horizontal scrolling
  final List<Map<String, dynamic>> activeCompetitions = [
    {
      "title": "30 Day Fat Loss Challenge",
      "prize": "Rs 12,500",
      "participants": 248,
    },
    {
      "title": "Muscle Builder Challenge",
      "prize": "Rs 8,000",
      "participants": 180,
    },
    {
      "title": "Cardio Endurance Challenge",
      "prize": "Rs 10,000",
      "participants": 320,
    },
  ];

  final List<Map<String, dynamic>> upcomingCompetitions = [
    {
      "title": "Summer Shred Challenge",
      "startsIn": "5 days",
    },
    {
      "title": "Winter Bulk Challenge",
      "startsIn": "12 days",
    },
    {
      "title": "New Year Transformation",
      "startsIn": "20 days",
    },
  ];

  final List<Map<String, dynamic>> announcements = [
    {
      "title": "New competitions launching soon",
    },
    {
      "title": "Major prizes coming next month",
    },
    {
      "title": "Special event announcement",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "dashboard_screen_text".L(),
        showBackButton: false,
        showMenuIcon: widget.drawerController != null,
        onMenuPressed: () {
          widget.drawerController?.toggle?.call();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DashboardHeader
              DashboardHeader(
                userName: _userName,
                userGreeting: _userGreeting,
                isDark: isDark,
              ),
              h4,
              // DashboardStats
              DashboardStats(isDark: isDark),
              h4,
              // Active Competitions Section
              _buildSectionHeading("active_competition".L(), isDark),
              h2,
              _buildHorizontalScrollSection(
                context: context,
                items: activeCompetitions,
                builder: (item) => ActiveCompetitionCard(
                  competition: item,
                  isDark: isDark,
                ),
              ),
              h4,
              // Upcoming Competitions Section
              _buildSectionHeading("upcoming_competition".L(), isDark),
              h2,
              _buildHorizontalScrollSection(
                context: context,
                items: upcomingCompetitions,
                builder: (item) => UpcomingCompetitionCard(
                  competition: item,
                  isDark: isDark,
                ),
              ),
              h4,
              // Announcements Section
              _buildSectionHeading("announcements".L(), isDark),
              h2,
              _buildHorizontalScrollSection(
                context: context,
                items: announcements,
                builder: (item) => AnnouncementCard(
                  announcement: item,
                  isDark: isDark,
                ),
              ),
              h3,
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a section heading widget
  Widget _buildSectionHeading(String title, bool isDark) {
    return Text(
      title,
      style: R.textStyles.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: isDark ? R.appColors.darkTextPrimary : R.appColors.textPrimary,
      ),
    );
  }

  /// Builds a horizontal scrollable section with ListView.builder
  /// Cards control their own height - no fixed heights
  Widget _buildHorizontalScrollSection<T>({
    required BuildContext context,
    required List<T> items,
    required Widget Function(T) builder,
  }) {
    final cardWidth = MediaQuery.of(context).size.width * 0.8;
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          items.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              right: index < items.length - 1 ? 12 : 0,
            ),
            child: SizedBox(
              width: cardWidth,
              child: builder(items[index]),
            ),
          ),
        ),
      ),
    );
  }
}
