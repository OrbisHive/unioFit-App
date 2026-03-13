import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/constants/heights_widths.dart';
import '../../../../core/resources/resources.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String? selectedReason;

  final List<String> reasons = [
    "I changed my mind",
    "Privacy concerns",
    "Too many notifications",
    "Found another service",
    "Other",
  ];
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: R.appColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Icon
              Icon(Icons.delete, color: Colors.white, size: 50),
              h2,
              // Title
              Text(
                "Delete Account",
                style: R.textStyles.poppins(
                  color: R.appColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              h2,
              // Subtitle
              Text(
                "Are you sure you want to Delete Account?",
                style: R.textStyles.poppins(
                  color: R.appColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              h2,
              // Yes button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: R.appColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account has been  Deleted"),
                      ),
                    );
                  },
                  child: Text(
                    "Yes, Delete",
                    style: R.textStyles.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              h2,
              // Cancel button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Not now",
                    style: R.textStyles.poppins(
                      color: R.appColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: Text(
          "Delete Account",
          style: R.textStyles.poppins(
            color: R.appColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16) + EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown
            Text(
              "Reason for deleting your account",
              style: R.textStyles.poppins(
                color: R.appColors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            h2,
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none, // ✅ remove extra border
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              value: selectedReason,
              hint: Text(
                "Select a reason",
                style: R.textStyles.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              items: reasons
                  .map(
                    (reason) => DropdownMenuItem<String>(
                      value: reason,
                      child: Text(
                        reason,
                        style: R.textStyles.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedReason = value;
                });
              },
            ),
            h2,
            // Delete Profile section
            Text(
              "Delete Profile",
              style: R.textStyles.poppins(
                color: R.appColors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            h2,
            const DeleteInfoPoint(
              text: "All your personal data will be permanently removed.",
            ),
            const DeleteInfoPoint(
              text: "This action cannot be undone.",
              bold: true,
            ),
            const DeleteInfoPoint(
              text: "Past activity and history will no longer be available.",
            ),
            const DeleteInfoPoint(
              text: "Access to your connections and messages will be lost.",
            ),
            const DeleteInfoPoint(
              text:
                  "Any ongoing participation or subscriptions will be canceled.",
            ),
            const DeleteInfoPoint(
              text:
                  "Your account will be permanently deleted in the next 14 days. "
                  "You may reactivate your profile by logging in during this time period.",
            ),
            const Spacer(),
            // Delete Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _showLogoutDialog();
                },
                child: const Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            h7,
          ],
        ),
      ),
    );
  }
}

class DeleteInfoPoint extends StatelessWidget {
  final String text;
  final bool bold;

  const DeleteInfoPoint({super.key, required this.text, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: R.textStyles.poppins(
                color: R.appColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
