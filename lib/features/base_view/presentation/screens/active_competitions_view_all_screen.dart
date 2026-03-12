import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/custom_app_bar.dart';
import 'competition_details_screen.dart';
import 'widgets/active_competition_card.dart';

/// Active Competitions View All Screen
/// Displays all active competitions with search functionality
class ActiveCompetitionsViewAllScreen extends StatefulWidget {
  static String route = '/active-competitions-view-all';

  const ActiveCompetitionsViewAllScreen({super.key});

  @override
  State<ActiveCompetitionsViewAllScreen> createState() =>
      _ActiveCompetitionsViewAllScreenState();
}

class _ActiveCompetitionsViewAllScreenState
    extends State<ActiveCompetitionsViewAllScreen> {
  final TextEditingController _searchController = TextEditingController();
  final bool isDark = false; // Will be determined from theme in build

  // Mock data - will be replaced with real data later
  final List<Map<String, dynamic>> _allCompetitions = [
    {
      "title": "30 Day Fat Loss Challenge",
      "prize": "Rs 12,500",
      "participants": 248,
      "competitionType": "ONLINE",
    },
    {
      "title": "Muscle Builder Challenge",
      "prize": "Rs 8,000",
      "participants": 180,
      "competitionType": "OFFLINE",
    },
    {
      "title": "Cardio Endurance Challenge",
      "prize": "Rs 10,000",
      "participants": 320,
      "competitionType": "ONLINE",
    },
    {
      "title": "Strength Training Challenge",
      "prize": "Rs 15,000",
      "participants": 195,
      "competitionType": "OFFLINE",
    },
    {
      "title": "Flexibility & Mobility Challenge",
      "prize": "Rs 7,500",
      "participants": 142,
      "competitionType": "ONLINE",
    },
    {
      "title": "HIIT Workout Challenge",
      "prize": "Rs 9,000",
      "participants": 267,
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
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "active_competition".L(),
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
                hintText: "search_competitions",
                prefixIcon: Icon(
                  Icons.search,
                  color: isDarkTheme
                      ? R.appColors.darkTextSecondary
                      : R.appColors.textSecondary,
                ),
                filledColor: isDarkTheme
                    ? R.appColors.darkSurfaceVariant
                    : R.appColors.surfaceVariant,
                borderRadius: 12,
              ),
              style: R.textStyles.poppins(
                fontSize: 14,
                color: isDarkTheme
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
                          color: isDarkTheme
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
                                },
                              );
                            },
                            child: ActiveCompetitionCard(
                              competition: _filteredCompetitions[index],
                              isDark: isDarkTheme,
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

