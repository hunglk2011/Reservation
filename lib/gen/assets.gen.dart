/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetImagesGen {
  const $AssetImagesGen();

  /// File path: asset/images/img_beef.png
  AssetGenImage get imgBeef => const AssetGenImage('asset/images/img_beef.png');

  /// File path: asset/images/img_coca.png
  AssetGenImage get imgCoca => const AssetGenImage('asset/images/img_coca.png');

  /// File path: asset/images/img_dish_cartoon.png
  AssetGenImage get imgDishCartoon =>
      const AssetGenImage('asset/images/img_dish_cartoon.png');

  /// File path: asset/images/img_family_cartoon.png
  AssetGenImage get imgFamilyCartoon =>
      const AssetGenImage('asset/images/img_family_cartoon.png');

  /// File path: asset/images/img_logo_bbq.png
  AssetGenImage get imgLogoBbq =>
      const AssetGenImage('asset/images/img_logo_bbq.png');

  /// File path: asset/images/img_logo_icon.png
  AssetGenImage get imgLogoIcon =>
      const AssetGenImage('asset/images/img_logo_icon.png');

  /// File path: asset/images/img_man.png
  AssetGenImage get imgMan => const AssetGenImage('asset/images/img_man.png');

  /// File path: asset/images/img_map.png
  AssetGenImage get imgMap => const AssetGenImage('asset/images/img_map.png');

  /// File path: asset/images/img_order_cartoon.png
  AssetGenImage get imgOrderCartoon =>
      const AssetGenImage('asset/images/img_order_cartoon.png');

  /// File path: asset/images/img_product_beef.png
  AssetGenImage get imgProductBeef =>
      const AssetGenImage('asset/images/img_product_beef.png');

  /// File path: asset/images/img_restaurant.png
  AssetGenImage get imgRestaurant =>
      const AssetGenImage('asset/images/img_restaurant.png');

  /// File path: asset/images/img_slideshow.png
  AssetGenImage get imgSlideshow =>
      const AssetGenImage('asset/images/img_slideshow.png');

  AssetGenImage get imgRestaurantBackground =>
      const AssetGenImage('asset/images/img_restaurant_background.png');

  AssetGenImage get imageGreenTick =>
      const AssetGenImage('asset/images/img_greenTick.png');

  AssetGenImage get imageAbout =>
      const AssetGenImage('asset/images/img_about_us.png');

  AssetGenImage get imageBeefSpice =>
      const AssetGenImage('asset/images/img_beef_spice.png');

  AssetGenImage get imageInfo =>
      const AssetGenImage('asset/images/img_info.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    imgBeef,
    imgCoca,
    imgDishCartoon,
    imgFamilyCartoon,
    imgLogoBbq,
    imgLogoIcon,
    imgMan,
    imgMap,
    imgOrderCartoon,
    imgProductBeef,
    imgRestaurant,
    imgSlideshow,
  ];
}

class Assets {
  const Assets._();

  static const $AssetImagesGen images = $AssetImagesGen();
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
