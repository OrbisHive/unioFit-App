import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [

          Row(
            children: [
              CircleAvatar(radius: 30, child: Icon(Icons.person, size: 35)),
              SizedBox(width: 15),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Saqib Riaz", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("+92 3324654652", style: TextStyle(color: Colors.grey)),
              ])
            ],
          ),

          SizedBox(height: 20),
          _tile("Edit Name", Icons.edit),

          Divider(),

          _sectionTitle("Account"),
          _tile("Saved Gyms", Icons.favorite),
          _tile("My Prizes", Icons.card_giftcard),

          Divider(),

          _sectionTitle("Preferences"),
          SwitchListTile(
            value: true,
            title: Text("Notifications"),
            onChanged: (v) {},
          ),

          Divider(),

          _tile("Logout", Icons.logout, isRed: true),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _tile(String title, IconData icon, {bool isRed = false}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : null),
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : null)),
      trailing: Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {},
    );
  }
}