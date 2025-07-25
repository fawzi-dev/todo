import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appearance',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: (val) {
                if (val != null) {
                  themeProvider.setTheme(val);
                }
              },
              title: Text('System Mode'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: (val) {
                if (val != null) {
                  themeProvider.setTheme(val);
                }
              },
              title: Text('Light'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: (val) {
                if (val != null) {
                  themeProvider.setTheme(val);
                }
              },
              title: Text('Dark '),
            ),
          ],
        ),
      ),
    );
  }
}
