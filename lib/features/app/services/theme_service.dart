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
      light: _modTheme(FlexThemeData.light(
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
      )),
      dark: _modTheme(FlexThemeData.dark(
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
      )),
    );
  }
  /// Use this to customize the color scheme (current code is an example).
  ThemeData _modTheme(ThemeData data) {
    final textTheme = _buildTextTheme(data.textTheme);

    return data.copyWith(
      appBarTheme: data.appBarTheme.copyWith(
        titleTextStyle: textTheme.displayMedium!.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: data.inputDecorationTheme.copyWith(
        filled: false,
      ),
      // textTheme: textTheme,
    );
  }

  /// Use this to customize the text theme (current code is an example).
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(
        fontFamily: 'HardGrunge',
      ),
      displayMedium: base.displayMedium!.copyWith(
        fontFamily: 'HardGrunge',
      ),
      displaySmall: base.displaySmall!.copyWith(
        fontFamily: 'HardGrunge',
      ),
      headlineLarge: base.headlineLarge!.copyWith(
        fontFamily: 'Dystopia',
      ),
      headlineMedium: base.headlineMedium!.copyWith(
        fontFamily: 'Dystopia',
      ),
      headlineSmall: base.headlineSmall!.copyWith(
        fontFamily: 'Dystopia',
      ),
      titleLarge: base.titleLarge!.copyWith(
        fontFamily: 'Technic',
      ),
      // TextField default
      titleMedium: base.titleMedium!.copyWith(
        fontFamily: 'Technic',
      ),
      titleSmall: base.titleSmall!.copyWith(
        fontFamily: 'Technic',
      ),
      bodyLarge: base.bodyLarge!.copyWith(
        fontFamily: 'Technic',
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        fontFamily: 'Technic',
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontFamily: 'Technic',
      ),
    );
  }

  void onModeChange(ThemeMode value) {
    state = state.copyWith(mode: value);
  }
}
