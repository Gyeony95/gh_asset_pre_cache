library gh_asset_pre_cache;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageCacheResource {

  ImageCacheResource._internal();
  static final ImageCacheResource _inst = ImageCacheResource._internal();

  factory ImageCacheResource() {
    return _inst;
  }
  bool isInit = false;


  Future<void> startImageCache(BuildContext context) async {
    if(isInit) return;
    isInit = true;
    final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestJson);
    final imageList = manifestMap.keys.where((asset) => asset.startsWith('assets/images/')).toList();
    final svgList = manifestMap.keys.where((asset) => asset.startsWith('assets/svg_images/')).toList();

    for (final imageUrl in imageList) {
      _imageCache(imageUrl, context);
    }
    for (final imageUrl in svgList) {
      _imageCache(imageUrl, context, isSvg: true);
    }
  }

  /// 이미지 전달받아서 캐싱함
  Future<void> _imageCache(String path, BuildContext context, {bool isSvg = false}) async {
    if(path.contains('.png') == false && path.contains('.svg') == false) return;
    final ByteData data = await rootBundle.load(path);
    final List<int> bytes = data.buffer.asUint8List();
    final ImageProvider imageProvider = MemoryImage(Uint8List.fromList(bytes));
    if(isSvg){
      final loader = SvgAssetLoader(path);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }else{
      precacheImage(imageProvider, context); // 이미지 캐싱
    }
  }
}