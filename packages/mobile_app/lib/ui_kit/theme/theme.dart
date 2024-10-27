import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/common_imports.dart';

export 'design_system_token.dart';

class AppThemeData {
  AppThemeData._();
  static ThemeData from({
    required final ColorScheme colorScheme,
  }) {
    final theme = ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
      textTheme: Typography.material2021(
        platform: defaultTargetPlatform,
        colorScheme: colorScheme,
      ).englishLike.merge(GoogleFonts.notoSansTextTheme()),
    );
    return theme.copyWith(
      extensions: [],
    );
  }

  static final brandLight = from(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple[200]!),
  );
  static final brandDark = from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple[50]!,
      brightness: Brightness.dark,
    ),
  );
}
