import 'package:flutter/material.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark mode'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: Text('Font size'),
            trailing: DropdownButton<int>(
              value: 16,
              items: <DropdownMenuItem<int>>[
                DropdownMenuItem(
                  value: 12,
                  child: Text('Small'),
                ),
                DropdownMenuItem(
                  value: 16,
                  child: Text('Medium'),
                ),
                DropdownMenuItem(
                  value: 20,
                  child: Text('Large'),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
