import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/resources.dart';
class PrivacyPolicyScreen extends StatelessWidget {
  static const route = "/privacy-policy";

  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
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
              _text(
                context,
                "This Privacy Policy explains how uniofit collects, uses, and protects your information when you use the application including competitions, gym discovery, and prize claims.",
              ),

              _heading(context, "2. Information We Collect"),
              _bullet(context, "Full name and phone number during registration."),
              _bullet(context, "Competition enrollment and participation data."),
              _bullet(context, "Photos or text submissions for online competitions."),
              _bullet(context, "Device information used for security and notifications."),
              _bullet(context, "Location information for gym discovery features."),

              _heading(context, "3. How We Use Your Information"),
              _bullet(context, "To create and manage your user account."),
              _bullet(context, "To allow participation in competitions."),
              _bullet(context, "To verify winners and process prize claims."),
              _bullet(context, "To improve application performance and user experience."),
              _bullet(context, "To send important updates, announcements, and notifications."),

              _heading(context, "4. Competition Participation Data"),
              _bullet(context, "Competition enrollment records are stored for fairness and verification."),
              _bullet(context, "Entries submitted in competitions may be reviewed by administrators."),
              _bullet(context, "Winner names and prize details may be publicly displayed in the app."),

              _heading(context, "5. Prize Claim Information"),
              _bullet(context, "Cash prize winners may provide bank account details."),
              _bullet(context, "Physical prize winners may submit shipping address information."),
              _bullet(context, "Sensitive information such as banking details is encrypted and stored securely."),

              _heading(context, "6. Gym Locator"),
              _bullet(context, "The gym locator uses Google Places services to display nearby gyms."),
              _bullet(context, "Location permission may be required to show gyms near your location."),
              _bullet(context, "Saved gyms are stored for user convenience."),

              _heading(context, "7. Notifications"),
              _bullet(context, "The application may send notifications about competitions, winners, and announcements."),
              _bullet(context, "Users can disable notifications from the settings screen."),
              _bullet(context, "Device tokens may be stored to deliver push notifications."),

              _heading(context, "8. Data Security"),
              _bullet(context, "We take appropriate measures to protect user information."),
              _bullet(context, "Sensitive data such as banking details is encrypted."),
              _bullet(context, "Only authorized administrators have access to sensitive data."),

              _heading(context, "9. Data Sharing"),
              _bullet(context, "We do not sell or rent your personal information."),
              _bullet(context, "Limited data may be processed by third-party services such as Google Maps and Firebase."),
              _bullet(context, "Information may be disclosed if required by law."),

              _heading(context, "10. User Rights"),
              _bullet(context, "Users can update their profile information."),
              _bullet(context, "Users may request account deletion through support."),
              _bullet(context, "Users can manage notification preferences within the app."),

              _heading(context, "11. Changes to Privacy Policy"),
              _bullet(context, "This privacy policy may be updated from time to time."),
              _bullet(context, "Updated policies will be reflected inside the application."),
              _bullet(context, "Continued use of the application indicates acceptance of the updated policy."),

              _heading(context, "12. Contact"),
              _bullet(context, "For any privacy related concerns please contact the application support team."),

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