import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/clues.dart';
import '../../../utils/screen_utils.dart';
import '../../settings/presentation/settings_dialog.dart';
import '../controllers/record_sheet_ctrl.dart';

class RecordSheetPage extends ConsumerWidget {
  const RecordSheetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordSheetCtrlProvider);
    final sectionTitleStyle = context.theme.textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: const Text("D&D Clue"),
        actions: [
          IconButton(
            onPressed: () => ref.read(recordSheetCtrlProvider.notifier).reset(),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => SettingsDialog.show(),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SeparatedColumn(
          separatorBuilder: () => boxXXL,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Suspects", style: sectionTitleStyle),
            Column(
              children: state.getCluesByType(ClueType.suspect).map(
                (clue) => _ClueDisplay(clue: clue),
              ).toList(),
            ),
            Text("Weapons", style: sectionTitleStyle),
            Column(
              children: state.getCluesByType(ClueType.weapon).map(
                (clue) => _ClueDisplay(clue: clue),
              ).toList(),
            ),
            Text("Rooms", style: sectionTitleStyle),
            Column(
              children: state.getCluesByType(ClueType.room).map(
                (clue) => _ClueDisplay(clue: clue),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClueDisplay extends ConsumerWidget {
  final Clue clue;

  const _ClueDisplay({Key? key, required this.clue}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      title: Text(clue.toString()),
      subtitle: clue.hasExtraText ? Text(clue.extraText!) : null,
      value: ref.watch(recordSheetCtrlProvider.select((state) => state[clue])),
      onChanged: (_) => ref.read(recordSheetCtrlProvider.notifier).toggleClue(clue),
    );
  }
}
