import 'package:example/main.dart';
import 'package:flutter/material.dart';

class ImageNonCachePage extends StatelessWidget {
  const ImageNonCachePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FeatureEnum.image.name),),
      body: Center(
        child: Image.asset('assets/test.jpg'),
      ),
    );
  }
}
