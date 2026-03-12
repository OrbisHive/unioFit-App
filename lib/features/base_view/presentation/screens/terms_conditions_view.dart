import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/resources.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  static const route = "/terms-condition";

  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
          style: R.textStyles.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? R.appColors.white : R.appColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading(context, "1. Introduction"),
              _text(context,
                  "These Terms & Conditions govern your use of the uniofit mobile application, including competitions, gym discovery, user profile features, and prize claims."),

              _heading(context, "2. Eligibility"),
              _bullet(context, "You must provide accurate full name and phone number."),
              _bullet(context, "One account per user is allowed."),
              _bullet(context, "You must be 18 years or older to participate in competitions."),

              _heading(context, "3. Competition Participation"),
              _bullet(context, "Only active competitions shown in the app can be joined."),
              _bullet(context, "A user may enroll once per competition."),
              _bullet(context, "Online competitions may require a photo submission."),
              _bullet(context, "Offline competitions require attending the event at the specified venue."),
              _bullet(context, "Enrollment cannot be reversed after submission."),

              _heading(context, "4. Winner Selection"),
              _bullet(context, "Winners are selected and announced solely by the admin."),
              _bullet(context, "uniofit reserves the right to verify user identity before confirming a winner."),
              _bullet(context, "All winner decisions made by the admin are final."),

              _heading(context, "5. Prize Claims"),
              _bullet(context, "Cash prize winners must submit accurate bank details."),
              _bullet(context, "Physical prize winners must provide valid shipping information."),
              _bullet(context, "Processing time may vary depending on verification and admin approval."),
              _bullet(context, "Incorrect or incomplete information may delay or cancel the claim."),

              _heading(context, "6. Gym Locator"),
              _bullet(context, "Gym data is sourced from Google Places and may not always be 100% accurate."),
              _bullet(context, "uniofit is not responsible for incorrect gym details, timings, or availability."),
              _bullet(context, "Saved gyms are stored for convenience only."),

              _heading(context, "7. Account Responsibilities"),
              _bullet(context, "You must keep your login information secure."),
              _bullet(context, "uniofit may block accounts involved in suspicious or fraudulent activity."),
              _bullet(context, "Device fingerprinting may be used to prevent multiple fake accounts."),

              _heading(context, "8. Notifications"),
              _bullet(context, "By using the app, you agree to receive competition updates, announcements, and winner notifications."),
              _bullet(context, "Notifications can be turned off in the Settings section."),

              _heading(context, "9. Data & Privacy"),
              _bullet(context, "Your submitted data is stored securely and used only for app functionality."),
              _bullet(context, "Bank details and shipping information are encrypted."),
              _bullet(context, "We do not sell or share your personal data with third parties."),

              _heading(context, "10. Prohibited Activities"),
              _bullet(context, "Creating multiple accounts."),
              _bullet(context, "Submitting false information or fraudulent entries."),
              _bullet(context, "Using the app for unlawful activities."),
              _bullet(context, "Abusing competitions or attempting to manipulate results."),

              _heading(context, "11. Liability Disclaimer"),
              _bullet(context, "uniofit is not responsible for physical injuries during offline competitions."),
              _bullet(context, "We do not guarantee gym availability, service quality, or pricing."),
              _bullet(context, "The app is provided on an 'as-is' basis without warranties."),

              _heading(context, "12. Admin Rights"),
              _bullet(context, "The admin may update competitions, rules, or app features at any time."),
              _bullet(context, "These Terms may be updated without prior notice."),
              _bullet(context, "Continued use of the app means you accept updated Terms."),

              SizedBox(height: 3.h),

              Center(
                child: Text(
                  "Last Updated: March 2026",
                  style: R.textStyles.poppins(
                    fontSize: 10.sp,
                    color: isDark ? R.appColors.white : Colors.grey,
                  ),
                ),
              ),

              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context, String title) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
      child: Text(
        title,
        style: R.textStyles.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: isDark ? R.appColors.white : R.appColors.black,
        ),
      ),
    );
  }

  Widget _text(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      style: R.textStyles.poppins(
        fontSize: 15.sp,
        color: isDark ? R.appColors.white : Colors.grey.shade800,
      ),
    );
  }

  Widget _bullet(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•  ",
            style: R.textStyles.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: R.textStyles.poppins(
                fontSize: 14.3.sp,
                color: isDark ? R.appColors.white : Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}