import 'package:example/main.dart';
import 'package:flutter/material.dart';

class ImageCachePage extends StatelessWidget {
  const ImageCachePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FeatureEnum.imageCache.name),),
      body: Center(
        child: Image.asset('assets/big_size_img_cached.jpg'),
      ),
    );
  }
}
