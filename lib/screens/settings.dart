import 'package:flutter/material.dart';
import 'package:miniproject2/main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isDarkMode = false;
  bool _showNotifications = true;
  int _fontSize = 16;

  ThemeData _themeData = ThemeData.light();

  void _toggleDarkMode(bool darkMode) {
    setState(() {
      _isDarkMode = darkMode;
      if (_isDarkMode) {
        _themeData = ThemeData.dark();
      } else {
        _themeData = ThemeData.light();
      }
    });
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _showNotifications = value;
    });
  }

  void _changeFontSize(int? value) {
    setState(() {
      _fontSize = value ?? _fontSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeData,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Settings'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Dark mode'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
              ),
            ),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: _showNotifications,
                onChanged: _toggleNotifications,
              ),
            ),
            ListTile(
              title: Text('Font size'),
              trailing: DropdownButton<int>(
                value: _fontSize,
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
                onChanged: _changeFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
