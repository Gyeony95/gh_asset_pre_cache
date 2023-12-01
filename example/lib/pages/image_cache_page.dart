import 'package:example/main.dart';
import 'package:flutter/material.dart';

void containCheck(){
  final ImageCache imageCache = PaintingBinding.instance.imageCache;
  debugPrint('contain check : ${imageCache.liveImageCount}');
}

class ImageCachePage extends StatelessWidget {
  const ImageCachePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    containCheck();
    return Scaffold(
      appBar: AppBar(title: Text(FeatureEnum.imageCache.name),),
      body: Center(
        child: Image.asset('assets/test_cached.jpg'),
      ),
    );
  }
}
