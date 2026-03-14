import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/confirmation_bottom_sheet.dart';
import 'widgets/dashboard_widget_helpers.dart';
import 'widgets/competition_details/competition_header_widget.dart';
import 'widgets/competition_details/competition_info_widget.dart';
import 'widgets/competition_details/competition_description_widget.dart';
import 'widgets/competition_details/competition_rules_widget.dart';
import 'widgets/competition_details/competition_prize_widget.dart';
import 'widgets/competition_details/competition_status_timeline_widget.dart';
import 'widgets/competition_details/competition_submission_section.dart';
import 'widgets/competition_details/competition_action_section.dart';

/// Competition Details Screen
/// Displays full competition information and handles enrollment/submission
class CompetitionDetailsScreen extends StatefulWidget {
  static String route = '/competition-details';

  const CompetitionDetailsScreen({super.key});

  @override
  State<CompetitionDetailsScreen> createState() =>
      _CompetitionDetailsScreenState();
}

class _CompetitionDetailsScreenState extends State<CompetitionDetailsScreen> {
  // Mock competition data - will be replaced with real data later
  late Map<String, dynamic> competition;

  // Mock user enrollment status
  bool isUserEnrolled = false;

  // Mock competition status
  String competitionStatus = "ACTIVE"; // ACTIVE, ENROLLMENT_CLOSED, JUDGING, ANNOUNCED

  // Mock competition type
  String competitionType = "ONLINE"; // ONLINE or OFFLINE

  // Mock submission status
  bool hasSubmitted = false;

  // Scroll controller for auto-scrolling
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Get competition data from arguments
    final args = Get.arguments as Map<String, dynamic>?;
    final defaultCompetition = _getDefaultCompetition();
    
    // Merge arguments with defaults to ensure all fields are present
    if (args != null) {
      competition = {...defaultCompetition, ...args};
    } else {
      competition = defaultCompetition;
    }
    
    // Set mock statuses based on competition data
    competitionStatus = competition["status"] as String? ?? "ACTIVE";
    competitionType = competition["type"] as String? ?? "ONLINE";
    isUserEnrolled = competition["isEnrolled"] as bool? ?? false;
    hasSubmitted = competition["hasSubmitted"] as bool? ?? false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    // Use post frame callback to ensure UI has updated
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Map<String, dynamic> _getDefaultCompetition() {
    return {
      "title": "30 Day Fat Loss Challenge",
      "description":
          "Transform your body in 30 days and win exciting cash prizes. Submit your transformation photos before the deadline. This competition is designed to help you achieve your fitness goals while competing for amazing rewards.",
      "prize": "Rs 12,500",
      "grandPrize": "Rs 10,000",
      "runnerUp": "Rs 2,500",
      "participants": 248,
      "startDate": "2024-01-15",
      "endDate": "2024-02-15",
      "status": "ACTIVE",
      "type": "ONLINE",
      "isEnrolled": false,
      "hasSubmitted": false,
      "rules": [
        "Submit clear transformation photos",
        "Follow competition timeline",
        "Respect submission guidelines",
        "Photos must be recent and authentic",
        "No photo editing or manipulation allowed",
      ],
      "winnerName": "John Doe",
    };
  }

  void _handleEnroll() {
    ConfirmationBottomSheet.show(
      context: context,
      title: "enroll_confirmation".L(),
      subtitle: "Are you ready to join this competition and start your fitness journey?",
      icon: Icons.local_fire_department,
      iconColor: R.appColors.error,
      confirmText: "Enroll Now",
      cancelText: "Cancel",
      confirmButtonColor: R.appColors.primary,
      onConfirm: () {
        setState(() {
          isUserEnrolled = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("enrollment_success".L()),
            backgroundColor: R.appColors.success,
          ),
        );
        // Auto-scroll to bottom after enrollment
        _scrollToBottom();
      },
    );
  }

  void _handleCheckIn() {
    ConfirmationBottomSheet.show(
      context: context,
      title: "check_in_confirmation".L(),
      subtitle: "Confirm your check-in at the selected gym location.",
      icon: Icons.location_on,
      iconColor: R.appColors.success,
      confirmText: "Check In",
      cancelText: "Cancel",
      confirmButtonColor: R.appColors.primary,
      onConfirm: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("check_in_success".L()),
            backgroundColor: R.appColors.success,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "competition_details".L(),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Competition Header
            CompetitionHeaderWidget(
              competition: competition,
              isDark: isDark,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Competition Info
                  CompetitionInfoWidget(
                    competition: competition,
                    isDark: isDark,
                  ),
                  h2,
                  // Competition Description
                  CompetitionDescriptionWidget(
                    description: competition["description"] as String? ??
                        "Transform your body and win exciting cash prizes. Submit your transformation photos before the deadline.",
                    isDark: isDark,
                  ),
                  h2,
                  // Rules & Requirements
                  CompetitionRulesWidget(
                    rules: competition["rules"] as List<String>? ?? [],
                    isDark: isDark,
                  ),
                  h2,
                  // Prize Information
                  CompetitionPrizeWidget(
                    competition: competition,
                    isDark: isDark,
                  ),
                  h2,
                  // Status Timeline (if enrolled)
                  if (isUserEnrolled)
                    CompetitionStatusTimelineWidget(
                      status: competitionStatus,
                      hasSubmitted: hasSubmitted,
                      isDark: isDark,
                    ),
                  if (isUserEnrolled) h4,
                  // Judging State Message
                  if (competitionStatus == "JUDGING")
                    _buildJudgingMessage(isDark),
                  if (competitionStatus == "JUDGING") h4,
                  // Winner Announced State
                  if (competitionStatus == "ANNOUNCED")
                    _buildWinnerCard(isDark),
                  if (competitionStatus == "ANNOUNCED") h4,
                  // Action Section
                  CompetitionActionSection(
                    competitionStatus: competitionStatus,
                    competitionType: competitionType,
                    isUserEnrolled: isUserEnrolled,
                    hasSubmitted: hasSubmitted,
                    onEnroll: _handleEnroll,
                    onCheckIn: _handleCheckIn,
                    isDark: isDark,
                  ),
                  h3,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJudgingMessage(bool isDark) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(4.w),
      child: Row(
        children: [
          Icon(
            Icons.gavel,
            color: R.appColors.warning,
            size: 32.px,
          ),
          w2,
          Expanded(
            child: Text(
              "submissions_under_review".L(),
              style: R.textStyles.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? R.appColors.darkTextPrimary
                    : R.appColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWinnerCard(bool isDark) {
    return DashboardWidgetHelpers.cardContainer(
      isDark: isDark,
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.emoji_events,
                color: R.appColors.warning,
                size: 32.px,
              ),
              w2,
              Text(
                "winner_announced_title".L(),
                style: R.textStyles.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: R.appColors.warning,
                ),
              ),
            ],
          ),
          h2,
          Text(
            "${"winner".L()}: ${competition["winnerName"] is String ? competition["winnerName"] as String : "TBD"}",
            style: R.textStyles.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? R.appColors.darkTextPrimary
                  : R.appColors.textPrimary,
            ),
          ),
          h2,
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: R.appColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.celebration,
                  color: R.appColors.success,
                ),
                w1,
                Text(
                  "congratulations".L(),
                  style: R.textStyles.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: R.appColors.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

