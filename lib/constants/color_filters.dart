import 'dart:ui';

class ColorFilters {
  static const ColorFilter identity = ColorFilter.matrix(<double>[
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter greyscale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter sepia = ColorFilter.matrix(<double>[
    0.393,
    0.769,
    0.189,
    0,
    0,
    0.349,
    0.686,
    0.168,
    0,
    0,
    0.272,
    0.534,
    0.131,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter pinkTint = ColorFilter.matrix(<double>[
    1,
    0.08,
    0.57,
    0,
    0,
    0,
    0.92,
    0.34,
    0,
    0,
    0,
    0,
    0.92,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter brown = ColorFilter.matrix(<double>[
    1.5,
    0,
    0,
    0,
    -100,
    0,
    1.5,
    0,
    0,
    -100,
    0,
    0,
    1.5,
    0,
    -100,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter warm = ColorFilter.matrix(<double>[
    1.1,
    0,
    0,
    0,
    -30,
    0,
    1.1,
    0,
    0,
    -30,
    0,
    0,
    1.1,
    0,
    -30,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter cool = ColorFilter.matrix(<double>[
    0.5997,
    0.4107,
    0.0299,
    0,
    -127,
    0.2996,
    0.5870,
    0.1140,
    0,
    -50,
    0.2102,
    0.1762,
    0.7040,
    0,
    -21,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter blackAndWhite = ColorFilter.matrix(<double>[
    0.33,
    0.33,
    0.33,
    0,
    75,
    0.33,
    0.33,
    0.33,
    0,
    75,
    0.33,
    0.33,
    0.33,
    0,
    75,
    0,
    0,
    0,
    1,
    0,
  ]);

  static const ColorFilter invert = ColorFilter.matrix(<double>[
    -1,
    0,
    0,
    0,
    255,
    0,
    -1,
    0,
    0,
    255,
    0,
    0,
    -1,
    0,
    255,
    0,
    0,
    0,
    1,
    0,
  ]);
}