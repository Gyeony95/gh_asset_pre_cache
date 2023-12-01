library gh_asset_pre_cache;

import 'dart:convert';
import 'package:flutter/material.dart';
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
    final imageList = manifestMap.keys.toList();
    List<String> extensionList = ['svg', 'png', 'jpg', 'jpeg'];
    imageList.removeWhere((e) => !extensionList.contains(e.split('.').last));
    for(var imageUrl in imageList){
      _imageCache(imageUrl, context);
    }
  }

  /// 이미지 전달받아서 캐싱함
  Future<void> _imageCache(String path, BuildContext context) async {
    if(path.contains('cache') == false) return;
    bool isSvg = path.contains('.svg');
    if(isSvg){
      final loader = SvgAssetLoader(path);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }else{
      precacheImage(AssetImage(path), context).then((_) => debugPrint('cache done : $path'));
    }
  }
}