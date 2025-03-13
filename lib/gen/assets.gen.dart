/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_post_1.jpg
  AssetGenImage get imgPost1 =>
      const AssetGenImage('assets/images/img_post_1.jpg');

  /// File path: assets/images/img_post_10.jpg
  AssetGenImage get imgPost10 =>
      const AssetGenImage('assets/images/img_post_10.jpg');

  /// File path: assets/images/img_post_11.jpg
  AssetGenImage get imgPost11 =>
      const AssetGenImage('assets/images/img_post_11.jpg');

  /// File path: assets/images/img_post_12.jpg
  AssetGenImage get imgPost12 =>
      const AssetGenImage('assets/images/img_post_12.jpg');

  /// File path: assets/images/img_post_2.jpg
  AssetGenImage get imgPost2 =>
      const AssetGenImage('assets/images/img_post_2.jpg');

  /// File path: assets/images/img_post_3.jpg
  AssetGenImage get imgPost3 =>
      const AssetGenImage('assets/images/img_post_3.jpg');

  /// File path: assets/images/img_post_7.jpg
  AssetGenImage get imgPost7 =>
      const AssetGenImage('assets/images/img_post_7.jpg');

  /// File path: assets/images/img_post_8.png
  AssetGenImage get imgPost8 =>
      const AssetGenImage('assets/images/img_post_8.png');

  /// File path: assets/images/img_post_9.jpg
  AssetGenImage get imgPost9 =>
      const AssetGenImage('assets/images/img_post_9.jpg');

  /// File path: assets/images/img_profile_1.png
  AssetGenImage get imgProfile1 =>
      const AssetGenImage('assets/images/img_profile_1.png');

  /// File path: assets/images/img_profile_2.png
  AssetGenImage get imgProfile2 =>
      const AssetGenImage('assets/images/img_profile_2.png');

  /// File path: assets/images/img_profile_3.jpg
  AssetGenImage get imgProfile3 =>
      const AssetGenImage('assets/images/img_profile_3.jpg');

  /// File path: assets/images/img_profile_4.jpg
  AssetGenImage get imgProfile4 =>
      const AssetGenImage('assets/images/img_profile_4.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    imgPost1,
    imgPost10,
    imgPost11,
    imgPost12,
    imgPost2,
    imgPost3,
    imgPost7,
    imgPost8,
    imgPost9,
    imgProfile1,
    imgProfile2,
    imgProfile3,
    imgProfile4,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/topAppBarContainer.svg
  SvgGenImage get topAppBarContainer =>
      const SvgGenImage('assets/svg/topAppBarContainer.svg');

  /// List of all assets
  List<SvgGenImage> get values => [topAppBarContainer];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
