import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_state.dart';

part 'theme_service.g.dart';

@riverpod
class ThemeService extends _$ThemeService {
  static const colorScheme = FlexScheme.orangeM3;

  @override
  ThemeState build() {
    return ThemeState(
      light: FlexThemeData.light(
        scheme: colorScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      dark: FlexThemeData.dark(
        scheme: colorScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
    );
  }

  void onModeChange(ThemeMode value) {
    state = state.copyWith(mode: value);
  }
}
