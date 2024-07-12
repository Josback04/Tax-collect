import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e5d1e),
      surfaceTint: Color(0xff6e5d1e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff0d88c),
      onPrimaryContainer: Color(0xff504102),
      secondary: Color(0xff675e41),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff4e6c1),
      onSecondaryContainer: Color(0xff534a2f),
      tertiary: Color(0xff516532),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcbe2a3),
      onTertiaryContainer: Color(0xff364819),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff1d1b16),
      onSurfaceVariant: Color(0xff4b4639),
      outline: Color(0xff7d7768),
      outlineVariant: Color(0xffcec6b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff33302a),
      inversePrimary: Color(0xffdcc57b),
      primaryFixed: Color(0xfffae195),
      onPrimaryFixed: Color(0xff231b00),
      primaryFixedDim: Color(0xffdcc57b),
      onPrimaryFixedVariant: Color(0xff554506),
      secondaryFixed: Color(0xfff0e2bd),
      onSecondaryFixed: Color(0xff221b05),
      secondaryFixedDim: Color(0xffd3c6a2),
      onSecondaryFixedVariant: Color(0xff4f462b),
      tertiaryFixed: Color(0xffd4ebab),
      onTertiaryFixed: Color(0xff121f00),
      tertiaryFixedDim: Color(0xffb8cf91),
      onTertiaryFixedVariant: Color(0xff3a4d1c),
      surfaceDim: Color(0xffdfd9d1),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3ea),
      surfaceContainer: Color(0xfff3ede4),
      surfaceContainerHigh: Color(0xffeee7df),
      surfaceContainerHighest: Color(0xffe8e2d9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff514103),
      surfaceTint: Color(0xff6e5d1e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff867332),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4b4228),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7e7455),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff364819),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff677b46),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff1d1b16),
      onSurfaceVariant: Color(0xff474235),
      outline: Color(0xff645f50),
      outlineVariant: Color(0xff817a6b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff33302a),
      inversePrimary: Color(0xffdcc57b),
      primaryFixed: Color(0xff867332),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6c5b1c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7e7455),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff655b3f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff677b46),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4f6230),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfd9d1),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3ea),
      surfaceContainer: Color(0xfff3ede4),
      surfaceContainerHigh: Color(0xffeee7df),
      surfaceContainerHighest: Color(0xffe8e2d9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2b2100),
      surfaceTint: Color(0xff6e5d1e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff514103),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff29220a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4b4228),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff172700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff364819),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff282418),
      outline: Color(0xff474235),
      outlineVariant: Color(0xff474235),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff33302a),
      inversePrimary: Color(0xffffebb1),
      primaryFixed: Color(0xff514103),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff372c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4b4228),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff342c13),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff364819),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff213204),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfd9d1),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3ea),
      surfaceContainer: Color(0xfff3ede4),
      surfaceContainerHigh: Color(0xffeee7df),
      surfaceContainerHighest: Color(0xffe8e2d9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f2),
      surfaceTint: Color(0xffdcc57b),
      onPrimary: Color(0xff3b2f00),
      primaryContainer: Color(0xffe6ce83),
      onPrimaryContainer: Color(0xff493b00),
      secondary: Color(0xffd3c6a2),
      onSecondary: Color(0xff383017),
      secondaryContainer: Color(0xff453d23),
      onSecondaryContainer: Color(0xffded0ac),
      tertiary: Color(0xfff3ffda),
      onTertiary: Color(0xff253507),
      tertiaryContainer: Color(0xffc1d899),
      onTertiaryContainer: Color(0xff304213),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff15130e),
      onSurface: Color(0xffe8e2d9),
      onSurfaceVariant: Color(0xffcec6b4),
      outline: Color(0xff979080),
      outlineVariant: Color(0xff4b4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d9),
      inversePrimary: Color(0xff6e5d1e),
      primaryFixed: Color(0xfffae195),
      onPrimaryFixed: Color(0xff231b00),
      primaryFixedDim: Color(0xffdcc57b),
      onPrimaryFixedVariant: Color(0xff554506),
      secondaryFixed: Color(0xfff0e2bd),
      onSecondaryFixed: Color(0xff221b05),
      secondaryFixedDim: Color(0xffd3c6a2),
      onSecondaryFixedVariant: Color(0xff4f462b),
      tertiaryFixed: Color(0xffd4ebab),
      onTertiaryFixed: Color(0xff121f00),
      tertiaryFixedDim: Color(0xffb8cf91),
      onTertiaryFixedVariant: Color(0xff3a4d1c),
      surfaceDim: Color(0xff15130e),
      surfaceBright: Color(0xff3c3933),
      surfaceContainerLowest: Color(0xff100e09),
      surfaceContainerLow: Color(0xff1d1b16),
      surfaceContainer: Color(0xff221f1a),
      surfaceContainerHigh: Color(0xff2c2a24),
      surfaceContainerHighest: Color(0xff37342f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f2),
      surfaceTint: Color(0xffdcc57b),
      onPrimary: Color(0xff3b2f00),
      primaryContainer: Color(0xffe6ce83),
      onPrimaryContainer: Color(0xff221a00),
      secondary: Color(0xffd7caa6),
      onSecondary: Color(0xff1c1602),
      secondaryContainer: Color(0xff9b9070),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3ffda),
      onTertiary: Color(0xff253507),
      tertiaryContainer: Color(0xffc1d899),
      onTertiaryContainer: Color(0xff121f00),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130e),
      onSurface: Color(0xfffffaf6),
      onSurfaceVariant: Color(0xffd2cab9),
      outline: Color(0xffaaa292),
      outlineVariant: Color(0xff898373),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d9),
      inversePrimary: Color(0xff564607),
      primaryFixed: Color(0xfffae195),
      onPrimaryFixed: Color(0xff171100),
      primaryFixedDim: Color(0xffdcc57b),
      onPrimaryFixedVariant: Color(0xff423500),
      secondaryFixed: Color(0xfff0e2bd),
      onSecondaryFixed: Color(0xff161100),
      secondaryFixedDim: Color(0xffd3c6a2),
      onSecondaryFixedVariant: Color(0xff3e361c),
      tertiaryFixed: Color(0xffd4ebab),
      onTertiaryFixed: Color(0xff0a1400),
      tertiaryFixedDim: Color(0xffb8cf91),
      onTertiaryFixedVariant: Color(0xff2a3b0d),
      surfaceDim: Color(0xff15130e),
      surfaceBright: Color(0xff3c3933),
      surfaceContainerLowest: Color(0xff100e09),
      surfaceContainerLow: Color(0xff1d1b16),
      surfaceContainer: Color(0xff221f1a),
      surfaceContainerHigh: Color(0xff2c2a24),
      surfaceContainerHighest: Color(0xff37342f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf6),
      surfaceTint: Color(0xffdcc57b),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe6ce83),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd7caa6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff5ffdd),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc1d899),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf6),
      outline: Color(0xffd2cab9),
      outlineVariant: Color(0xffd2cab9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d9),
      inversePrimary: Color(0xff342900),
      primaryFixed: Color(0xfffee598),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe1c97f),
      onPrimaryFixedVariant: Color(0xff1d1600),
      secondaryFixed: Color(0xfff4e6c1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd7caa6),
      onSecondaryFixedVariant: Color(0xff1c1602),
      tertiaryFixed: Color(0xffd8efaf),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbcd395),
      onTertiaryFixedVariant: Color(0xff0e1a00),
      surfaceDim: Color(0xff15130e),
      surfaceBright: Color(0xff3c3933),
      surfaceContainerLowest: Color(0xff100e09),
      surfaceContainerLow: Color(0xff1d1b16),
      surfaceContainer: Color(0xff221f1a),
      surfaceContainerHigh: Color(0xff2c2a24),
      surfaceContainerHighest: Color(0xff37342f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
