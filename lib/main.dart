import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'features/app/services/theme_service.dart';
import 'features/record_sheet/presentation/record_sheet_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeServiceProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D&D Clue',
      theme: themeState.light,
      darkTheme: themeState.dark,
      themeMode: themeState.mode,
      home: const RecordSheetPage(),
      builder: FlutterSmartDialog.init(),
    );
  }
}

