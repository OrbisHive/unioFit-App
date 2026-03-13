import 'package:flutter/material.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';
import 'package:unio_fit/core/utils/custom_app_bar.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/constants/heights_widths.dart';
class NotificationScreen extends StatelessWidget {
  static String route = "/simple-notification";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final List<Map<String, dynamic>> notifications = [
      {
        "title": "New Competition Launched!",
        "subtitle": "Join now to win exciting rewards.",
        "time": "2 hrs ago",
        "icon": Icons.emoji_events,
      },
      {
        "title": "Prize Winner Announced",
        "subtitle": "Congrats to this month’s top performer.",
        "time": "5 hrs ago",
        "icon": Icons.card_giftcard,
      },
      {
        "title": "Prize Winner Announced",
        "subtitle": "Congrats to this month’s top performer.",
        "time": "5 hrs ago",
        "icon": Icons.card_giftcard,
      },
      {
        "title": "Prize Winner Announced",
        "subtitle": "Congrats to this month’s top performer.",
        "time": "5 hrs ago",
        "icon": Icons.card_giftcard,
      },


      {
        "title": "Reward Updated",
        "subtitle": "Your winning points have been added.",
        "time": "2 days ago",
        "icon": Icons.star,
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Notification_title".L(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _notificationTile(
              title: item["title"],
              subtitle: item["subtitle"],
              time: item["time"],
              icon: item["icon"],
              colorScheme: colorScheme,
            ),
          );
        },
      ),
    );
  }

  Widget _notificationTile({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.15),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: colorScheme.primary,
              ),
            ),
          ),
          w3,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: R.textStyles.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onBackground,
                  ),
                ),
                Text(
                  subtitle,
                  style: R.textStyles.poppins(
                    fontSize: 13,
                    color: colorScheme.onBackground.withOpacity(0.70),
                  ),
                ),
                h1,
                Text(
                  time,
                  style: R.textStyles.poppins(
                    fontSize: 11,
                    color: colorScheme.onBackground.withOpacity(0.50),
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