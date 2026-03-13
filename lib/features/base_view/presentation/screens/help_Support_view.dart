import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/features/base_view/presentation/screens/privacy_policy.dart';
import 'package:unio_fit/features/base_view/presentation/screens/terms_conditions_view.dart';
import 'package:unio_fit/features/base_view/presentation/screens/support_chat_screen.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {

  late final List<Map<String, String>> faqs = [
    {"question": "faq1_question", "answer": "faq1_answer"},
    {"question": "faq2_question", "answer": "faq2_answer"},
    {"question": "faq3_question", "answer": "faq3_answer"},
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "help_and_support".L(),
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
            "faqs".L(),
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
                                faq["question"]!.L(),
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
                          faq["answer"]!.L(),
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
            "support".L(),
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),

          SizedBox(height: 1.h),

          _tile("contact_support", Icons.support_agent, isDark),
          _tile("report_an_issue", Icons.report_problem, isDark),

          SizedBox(height: 2.h),

          /// Legal Section
          Text(
            "legal".L(),
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? R.appColors.white : R.appColors.black,
            ),
          ),

          SizedBox(height: 1.h),

          _tile("terms_and_conditions", Icons.description, isDark),
          _tile("privacy_policy", Icons.lock, isDark),

          SizedBox(height: 3.h),

          Center(
            child: Text(
              "app_version".L(),
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

  Widget _tile(String key, IconData icon, bool isDark) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDark ? R.appColors.white : R.appColors.primary,
      ),
      title: Text(
        key.L(),
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
        if (key == "contact_support" || key == "report_an_issue") {
          Get.to(() => const SupportChatScreen());
        } else if (key == "privacy_policy") {
          Get.to(() => const PrivacyPolicyScreen());
        } else if (key == "terms_and_conditions") {
          Get.to(() => const TermsAndConditionsScreen());
        }
      },
    );
  }
}