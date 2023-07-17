import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/clues.dart';
import 'record_sheet_state.dart';

part 'record_sheet_ctrl.g.dart';

@riverpod
class RecordSheetCtrl extends _$RecordSheetCtrl {
  @override
  RecordSheetState build() {
    return RecordSheetState(Map<Clue, bool>.unmodifiable({
      for (final clue in Clue.values) clue : false,
    }));
  }

  void toggleClue(Clue clue) {
    final clues = {
      ...state.clues,
    };

    clues[clue] = !state[clue];

    state = state.copyWith(Map<Clue, bool>.unmodifiable(clues));
  }

  void reset() {
    state = build();
  }
}
