import 'package:flutter/material.dart';

class ImageNonCachePage extends StatelessWidget {
  const ImageNonCachePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset('assets/big_size_img.jpg'),
      ),
    );
  }
}
