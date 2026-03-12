import 'package:flutter/material.dart';
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
      "Go to the Gym Locator section and enable location access. The app will automatically show gyms near you along with distance and ratings."
    },
    {
      "question": "How do I view details about a gym?",
      "answer":
      "Tap on any gym in the list to open its detail page. You can see photos, address, opening hours, ratings, and reviews."
    },
    {
      "question": "Can I save a gym for later?",
      "answer":
      "Yes. Tap the heart icon on any gym detail page to save it to your favorites. You can access all saved gyms from your Profile section."
    },
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Support"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          /// FAQs Title
          Text(
            "FAQs",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          /// FAQ List
          ListView.builder(
            itemCount: faqs.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (context, index) {
              final faq = faqs[index];
              final isExpanded = expandedIndex == index;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    /// Question
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isExpanded ? R.appColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                faq["question"]!,
                                style: R.textStyles.poppins(
                                  color: isExpanded
                                      ? Colors.white
                                      : R.appColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              isExpanded ? Icons.remove : Icons.add,
                              color: isExpanded ? Colors.white : Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Answer
                    if (isExpanded)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10)),
                        ),
                        child: Text(
                          faq["answer"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 20),

          /// Support Section
          Text(
            "Support",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _tile("Contact Support", Icons.support_agent),
          _tile("Report an Issue", Icons.report_problem),

          SizedBox(height: 20),

          /// Legal Section
          Text("Legal",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _tile("Terms & Conditions", Icons.description),
          _tile("Privacy Policy", Icons.lock),

          SizedBox(height: 30),

          /// Footer Version
          Center(
            child: Text(
              "App Version 1.0.0",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable Tile Widget
  Widget _tile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {},
    );
  }
}