import 'package:recase/recase.dart';

enum ClueType {
  suspect,
  weapon,
  room,
}

enum Clue {
  tordek(type: ClueType.suspect, extraText: "the Dwarf Fighter"),
  nebin(type: ClueType.suspect, extraText: "the Gnome Wizard"),
  mialee(type: ClueType.suspect, extraText: "the Elf Wizard"),
  lidda(type: ClueType.suspect, extraText: "the Halfling Rogue"),
  regdar(type: ClueType.suspect, extraText: "the Human Fighter"),
  ember(type: ClueType.suspect, extraText: "the Human Monk"),
  vorpalSword(type: ClueType.weapon),
  maceOfDisruption(type: ClueType.weapon),
  ringOfMagicMissiles(type: ClueType.weapon),
  staffOfPower(type: ClueType.weapon),
  flamingBattleAxe(type: ClueType.weapon),
  daggerOfVenom(type: ClueType.weapon),
  chamber(type: ClueType.room, extraText: "of Tricks and Traps"),
  dungeon(type: ClueType.room),
  dragonsLair(type: ClueType.room),
  lostCrypt(type: ClueType.room),
  magicalArmory(type: ClueType.room),
  wizardsTower(type: ClueType.room),
  grandHall(type: ClueType.room),
  treasureChamber(type: ClueType.room),
  library(type: ClueType.room, extraText: "of Arcane Tomes");

  final ClueType type;
  final String? extraText;

  const Clue({required this.type, this.extraText});

  bool get hasExtraText => extraText != null;

  @override
  String toString() => switch (this) {
    Clue.maceOfDisruption => "Mace of Disruption",
    Clue.ringOfMagicMissiles => "Ring of Magic Missiles",
    Clue.staffOfPower => "Staff of Power",
    Clue.daggerOfVenom => "Dagger of Venom",
    Clue.dragonsLair => "Dragon's Lair",
    Clue.wizardsTower => "Wizard's Tower",
    _ => ReCase(name).titleCase,
  };
}