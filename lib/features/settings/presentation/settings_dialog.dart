import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../app/services/theme_service.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () => _changeMode(ref, ThemeMode.light),
          child: const Text("Light"),
        ),
        SimpleDialogOption(
          onPressed: () => _changeMode(ref, ThemeMode.dark),
          child: const Text("Dark"),
        ),
        SimpleDialogOption(
          onPressed: () => _changeMode(ref, ThemeMode.system),
          child: const Text("System"),
        ),
      ],
    );
  }

  void _changeMode(WidgetRef ref, ThemeMode mode) {
    ref.read(themeServiceProvider.notifier).onModeChange(mode);
    SmartDialog.dismiss();
  }

  static void show() {
    SmartDialog.show(
      builder: (_) => const SettingsDialog(),
    );
  }
}
