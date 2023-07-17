import '../../../data/clues.dart';

class RecordSheetState {
  final Map<Clue, bool> clues;

  RecordSheetState(this.clues);

  RecordSheetState copyWith(Map<Clue, bool>? clues) => RecordSheetState(clues ?? this.clues);

  bool operator [](Clue clue) => clues[clue] ?? false;

  List<Clue> getCluesByType(ClueType type) => List<Clue>.unmodifiable(clues.keys.where((clue) => clue.type == type));
}

