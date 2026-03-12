import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/features/base_view/presentation/screens/privacy_policy.dart';
import 'package:unio_fit/features/base_view/presentation/screens/terms_conditions_view.dart';
import 'package:unio_fit/features/base_view/presentation/screens/support_chat_screen.dart';
import '../../../../core/resources/resources.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {

  late final List<Map<String, String>> faqs = [
    {
      "question": "How can I find nearby gyms?",
      "answer":
      "Go to the Gym Locator section and enable location access. The app will automatically show gyms near you along with distance and ratings.",
    },
    {
      "question": "How do I view details about a gym?",
      "answer":
      "Tap on any gym in the list to open its detail page. You can see photos, address, opening hours, ratings, and reviews.",
    },
    {
      "question": "Can I save a gym for later?",
      "answer":
      "Yes. Tap the heart icon on any gym detail page to save it to your favorites. You can access all saved gyms from your Profile section.",
    },
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help & Support",
          style: R.textStyles.poppins(
            fontSize: 18.sp,
            color: isDark ? R.appColors.white : R.appColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(4.w),
        children: [

          /// FAQs
          Text(
            "FAQs",
            style: R.textStyles.poppins(
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),

          SizedBox(height: 2.h),

          ListView.builder(
            itemCount: faqs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {

              final faq = faqs[index];
              final isExpanded = expandedIndex == index;

              return Container(
                margin: EdgeInsets.only(bottom: 1.h),
                decoration: BoxDecoration(
                  color: isDark ? R.appColors.darkSurface : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.white10
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [

                    InkWell(
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: isExpanded
                              ? R.appColors.primary
                              : (isDark
                              ? R.appColors.darkSurface
                              : Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(
                              child: Text(
                                faq["question"]!,
                                style: R.textStyles.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isExpanded
                                      ? R.appColors.white
                                      : (isDark
                                      ? R.appColors.white
                                      : R.appColors.black),
                                ),
                              ),
                            ),

                            Icon(
                              isExpanded ? Icons.remove : Icons.add,
                              color: isExpanded
                                  ? R.appColors.white
                                  : (isDark
                                  ? R.appColors.white
                                  : Colors.black54),
                            ),

                          ],
                        ),
                      ),
                    ),

                    if (isExpanded)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        child: Text(
                          faq["answer"]!,
                          style: R.textStyles.poppins(
                            fontSize: 15.sp,
                            color: isDark
                                ? R.appColors.white
                                : R.appColors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 2.h),

          /// Support Section
          Text(
            "Support",
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),

          SizedBox(height: 1.h),

          _tile("Contact Support", Icons.support_agent, isDark),
          _tile("Report an Issue", Icons.report_problem, isDark),

          SizedBox(height: 2.h),

          /// Legal Section
          Text(
            "Legal",
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),

          SizedBox(height: 1.h),

          _tile("Terms & Conditions", Icons.description, isDark),
          _tile("Privacy Policy", Icons.lock, isDark),

          SizedBox(height: 3.h),

          Center(
            child: Text(
              "App Version 1.0.0",
              style: R.textStyles.poppins(
                color: isDark ? R.appColors.white : Colors.grey.shade600,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(String title, IconData icon, bool isDark) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDark ? R.appColors.white : R.appColors.primary,
      ),
      title: Text(
        title,
        style: R.textStyles.poppins(
          fontSize: 15.5.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? R.appColors.white : R.appColors.primary,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: isDark ? R.appColors.white : Colors.grey,
      ),
      onTap: () {

        if (title == "Contact Support") {
          Get.to(() => const SupportChatScreen());
        }

        else if (title == "Report an Issue") {
          Get.to(() => const SupportChatScreen());
        }

        else if (title == "Privacy Policy") {
          Get.to(() => const PrivacyPolicyScreen());
        }

        else if (title == "Terms & Conditions") {
          Get.to(() => const TermsAndConditionsScreen());
        }

      },
    );
  }
}