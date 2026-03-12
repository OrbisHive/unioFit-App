import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/announcement_card.dart';

/// Announcements View All Screen
/// Displays all announcements with search functionality
class AnnouncementsViewAllScreen extends StatefulWidget {
  static String route = '/announcements-view-all';

  const AnnouncementsViewAllScreen({super.key});

  @override
  State<AnnouncementsViewAllScreen> createState() =>
      _AnnouncementsViewAllScreenState();
}

class _AnnouncementsViewAllScreenState
    extends State<AnnouncementsViewAllScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Mock data - will be replaced with real data later
  final List<Map<String, dynamic>> _allAnnouncements = [
    {
      "title": "New competitions launching soon",
    },
    {
      "title": "Major prizes coming next month",
    },
    {
      "title": "Special event announcement",
    },
    {
      "title": "New gym partnerships announced",
    },
    {
      "title": "Fitness app update coming soon",
    },
    {
      "title": "Community challenge starting next week",
    },
  ];

  List<Map<String, dynamic>> _filteredAnnouncements = [];

  @override
  void initState() {
    super.initState();
    _filteredAnnouncements = _allAnnouncements;
    _searchController.addListener(_filterAnnouncements);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterAnnouncements);
    _searchController.dispose();
    super.dispose();
  }

  void _filterAnnouncements() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredAnnouncements = _allAnnouncements;
      } else {
        _filteredAnnouncements = _allAnnouncements
            .where((announcement) => (announcement["title"] as String)
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
        title: "announcements".L(),
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
                hintText: "search_announcements",
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
            // List of Announcements
            Expanded(
              child: _filteredAnnouncements.isEmpty
                  ? Center(
                      child: Text(
                        "No announcements found",
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
                      itemCount: _filteredAnnouncements.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: AnnouncementCard(
                            announcement: _filteredAnnouncements[index],
                            isDark: isDark,
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

