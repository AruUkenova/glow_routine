import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../l10n/app_strings.dart';
import '../../services/secure_storage_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.appState, required this.tab});

  final AppState appState;
  final String tab;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final storage = SecureStorageService();
  final controller = TextEditingController();
  String? loaded;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(widget.appState.locale);

    return Scaffold(
      appBar: AppBar(
        title: Text('${strings.settings} (tab=${widget.tab})'),
        actions: [
          IconButton(
            tooltip: strings.localeToggle,
            onPressed: widget.appState.toggleLocale,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(strings.token, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'demo_token_123',
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
  onPressed: () async {
    await storage.saveToken(controller.text.trim());

    if (!context.mounted) return; // <-- исправление

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${strings.save}: OK')),
    );
  },
  child: Text(strings.save),
),
                OutlinedButton(
                  onPressed: () async {
                    final v = await storage.readToken();
                    setState(() => loaded = v);
                  },
                  child: Text(strings.load),
                ),
                TextButton(
                  onPressed: () async {
                    await storage.deleteToken();
                    setState(() => loaded = null);
                  },
                  child: Text(strings.delete),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Loaded token: ${loaded ?? "(null)"}'),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: widget.appState.toggleLocale,
              icon: const Icon(Icons.language),
              label: Text(strings.localeToggle),
            ),
          ],
        ),
      ),
    );
  }
}