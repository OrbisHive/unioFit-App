import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';
import 'package:unio_fit/core/utils/custom_app_bar.dart';
import '../../../core/resources/resources.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Saqib Riaz";
  String phone = "+92 3324654652";

  TextEditingController nameController = TextEditingController();

  void editNamePopup() {
    nameController.text = name;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Edit_Name".L(),
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.5,
                ),
              ),
              hintText: "Enter_your_name".L(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel_lbl".L(),
                style: R.textStyles.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                });
                Navigator.pop(context);
              },
              child: Text(
                "Save_lbl".L(),
                style: R.textStyles.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "my_profile".L()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person, size: 35),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(phone, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          _tile("Edit_Name".L(), Icons.edit, onTap: editNamePopup),

          const Divider(),

          _sectionTitle("Account_lbl".L()),

          _tile("Saved_Gyms".L(), Icons.favorite),

          _tile("My_Prizes".L(), Icons.card_giftcard),

          const Divider(),

          _tile("Logout_lbl".L(), Icons.logout, isRed: true, onTap: showLogoutDialog),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _tile(
    String title,
    IconData icon, {
    bool isRed = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : null),
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : null)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: onTap,
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children:  [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 8),
              Text("logout_lbl".L()),
            ],
          ),
          content:  Text(
            "want_to_logout_from_your_account?".L(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:  Text("Cancel_lbl".L()),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context);

                // Logout logic here
                // Navigator.pushReplacement(context,
                // MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child:  Text("Logout_lbl".L()),
            ),
          ],
        );
      },
    );
  }
}
