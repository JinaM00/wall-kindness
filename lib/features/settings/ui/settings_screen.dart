import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: Text('Show decorative stickers', style: theme.textTheme.bodyMedium),
              value: true,
              onChanged: (_) {},
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('About Kindness Wall', style: theme.textTheme.bodyMedium),
              subtitle: const Text('A small place to leave big kindness.'),
            ),
          ),
        ],
      ),
    );
  }
}