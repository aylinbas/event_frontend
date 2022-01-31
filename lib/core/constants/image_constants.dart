class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    _instace ??= ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  final _SVG svgAssets = _SVG();
  final _PNG pngAssets = _PNG();
}

class _SVG {
  final String plusIcon = 'ic_plus'.toSVG;
}

class _PNG {
  final String flutterMarsLogo = 'fluttermars_logo_mobile'.toPNG;
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/images/Png/$this.png';
  String get toJPEG => 'assets/$this.jpeg';
  String get toJSON => 'assets/$this.json';
  String get toSVG => 'assets/images/Svg/$this.svg';
}
