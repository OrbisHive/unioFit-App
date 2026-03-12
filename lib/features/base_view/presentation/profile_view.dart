import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
          title:  Text("Edit Name",style: R.textStyles.poppins(fontSize: 16.sp,fontWeight: FontWeight.w600),),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.5,
                ),
              ),
              hintText: "Enter your name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:  Text("Cancel",style: R.textStyles.poppins(fontSize: 15.sp,fontWeight: FontWeight.w600)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                });
                Navigator.pop(context);
              },
              child:  Text("Save",style: R.textStyles.poppins(fontSize: 15.sp,fontWeight: FontWeight.w600,color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
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
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    phone,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 20),

          _tile(
            "Edit Name",
            Icons.edit,
            onTap: editNamePopup,
          ),

          const Divider(),

          _sectionTitle("Account"),

          _tile("Saved Gyms", Icons.favorite),

          _tile("My Prizes", Icons.card_giftcard),

          const Divider(),

          _tile(
            "Logout",
            Icons.logout,
            isRed: true,
            onTap: showLogoutDialog,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _tile(String title, IconData icon,
      {bool isRed = false, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : null),
      title: Text(
        title,
        style: TextStyle(color: isRed ? Colors.red : null),
      ),
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
            children: const [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 8),
              Text("Logout"),
            ],
          ),
          content: const Text(
            "Are you sure you want to logout from your account?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);

                // Logout logic here
                // Navigator.pushReplacement(context,
                // MaterialPageRoute(builder: (_) => LoginScreen()));

              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}