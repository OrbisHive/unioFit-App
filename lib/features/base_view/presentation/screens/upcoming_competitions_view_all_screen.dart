import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/custom_app_bar.dart';
import 'competition_details_screen.dart';
import 'widgets/upcoming_competition_card.dart';

/// Upcoming Competitions View All Screen
/// Displays all upcoming competitions with search functionality
class UpcomingCompetitionsViewAllScreen extends StatefulWidget {
  static String route = '/upcoming-competitions-view-all';

  const UpcomingCompetitionsViewAllScreen({super.key});

  @override
  State<UpcomingCompetitionsViewAllScreen> createState() =>
      _UpcomingCompetitionsViewAllScreenState();
}

class _UpcomingCompetitionsViewAllScreenState
    extends State<UpcomingCompetitionsViewAllScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Mock data - will be replaced with real data later
  final List<Map<String, dynamic>> _allCompetitions = [
    {
      "title": "Summer Shred Challenge",
      "startsIn": "5 days",
      "competitionType": "ONLINE",
    },
    {
      "title": "Winter Bulk Challenge",
      "startsIn": "12 days",
      "competitionType": "OFFLINE",
    },
    {
      "title": "New Year Transformation",
      "startsIn": "20 days",
      "competitionType": "ONLINE",
    },
    {
      "title": "Spring Fitness Challenge",
      "startsIn": "30 days",
      "competitionType": "OFFLINE",
    },
    {
      "title": "Marathon Training Challenge",
      "startsIn": "45 days",
      "competitionType": "ONLINE",
    },
    {
      "title": "Yoga & Meditation Challenge",
      "startsIn": "7 days",
      "competitionType": "ONLINE",
    },
  ];

  List<Map<String, dynamic>> _filteredCompetitions = [];

  @override
  void initState() {
    super.initState();
    _filteredCompetitions = _allCompetitions;
    _searchController.addListener(_filterCompetitions);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCompetitions);
    _searchController.dispose();
    super.dispose();
  }

  void _filterCompetitions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCompetitions = _allCompetitions;
      } else {
        _filteredCompetitions = _allCompetitions
            .where((competition) => (competition["title"] as String)
                .toLowerCase()
                .contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "upcoming_competition".L(),
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: R.appDecorations.inputDecorationWithHint(
                hintText: "search_upcoming_competitions",
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                ),
                filledColor: isDark
                    ? R.appColors.darkSurfaceVariant
                    : R.appColors.surfaceVariant,
                borderRadius: 12,
              ),
              style: R.textStyles.poppins(
                fontSize: 14,
                color: isDark
                    ? R.appColors.darkTextPrimary
                    : R.appColors.textPrimary,
              ),
            ),
            h3,
            // List of Competitions
            Expanded(
              child: _filteredCompetitions.isEmpty
                  ? Center(
                      child: Text(
                        "No competitions found",
                        style: R.textStyles.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? R.appColors.darkTextSecondary
                              : R.appColors.textSecondary,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredCompetitions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                CompetitionDetailsScreen.route,
                                arguments: {
                                  ..._filteredCompetitions[index],
                                  "type": "ONLINE",
                                  "status": "ACTIVE",
                                  "prize": "Rs 10,000",
                                  "participants": 0,
                                },
                              );
                            },
                            child: UpcomingCompetitionCard(
                              competition: _filteredCompetitions[index],
                              isDark: isDark,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

