library gh_asset_pre_cache;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GhAssetPreCache {

  GhAssetPreCache._internal();
  static final GhAssetPreCache _inst = GhAssetPreCache._internal();

  factory GhAssetPreCache() {
    return _inst;
  }
  bool isInit = false;


  void startImageCache(){
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.addPostFrameCallback((_) async {
      BuildContext? context = binding.rootElement;
      if(context != null) _startImageCache(context);
    });
  }

  Future<void> _startImageCache(BuildContext context) async {
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
    bool isSvg = path.contains('.svg');
    if(isSvg){
      final loader = SvgAssetLoader(path);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }else{
      precacheImage(AssetImage(path), context);
    }
  }
}