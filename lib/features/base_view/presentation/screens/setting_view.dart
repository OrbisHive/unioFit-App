import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool comp = true;
  bool announce = true;
  bool winners = true;
  bool account = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Notifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          SwitchListTile(
            value: comp,
            title: Text("Competition Updates"),
            onChanged: (v) => setState(() => comp = v),
          ),
          SwitchListTile(
            value: announce,
            title: Text("Announcements"),
            onChanged: (v) => setState(() => announce = v),
          ),
          SwitchListTile(
            value: winners,
            title: Text("Winner Notifications"),
            onChanged: (v) => setState(() => winners = v),
          ),
          SwitchListTile(
            value: account,
            title: Text("Account Updates"),
            onChanged: (v) => setState(() => account = v),
          ),
        ],
      ),
    );
  }
}