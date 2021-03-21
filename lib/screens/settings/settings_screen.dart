import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onetime/di/state_notifier/theme_controller.dart';
import 'package:onetime/models/theme/theme_mode_extension.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final themeSelector = useProvider(themeSelectorProvider);
    // final currentThemeMode = useProvider(themeSelectorProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      // body: SafeArea(
      //   child: ListView.builder(
      //     itemCount: ThemeMode.values.length,
      //     itemBuilder: (_, index) {
      //       final themeMode = ThemeMode.values[index];
      //       return RadioListTile<ThemeMode>(
      //         value: themeMode,
      //         groupValue: currentThemeMode,
      //         onChanged: (newTheme) {
      //           themeSelector.change(newTheme);
      //         },
      //         title: Text(themeMode.title),
      //         subtitle: Text(themeMode.subtitle),
      //         controlAffinity: ListTileControlAffinity.platform,
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
