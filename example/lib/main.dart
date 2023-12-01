import 'package:example/pages/image_cache_page.dart';
import 'package:example/pages/image_non_cache_page.dart';
import 'package:flutter/material.dart';
import 'package:gh_asset_pre_cache/gh_asset_pre_cache.dart';

void main() {
  ImageCacheResource().startImageCache();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FeatureList(),
        FeatureEnum.image.route: (context) => const ImageNonCachePage(),
        FeatureEnum.imageCache.route: (context) => const ImageCachePage(),
      },
    );
  }
}
void containCheck(){
  final ImageCache imageCache = PaintingBinding.instance.imageCache;
  debugPrint('contain check : ${imageCache.liveImageCount}');
}

class FeatureList extends StatelessWidget {
  const FeatureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody(){
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: FeatureEnum.values.length,
      itemBuilder : listItem,
    );
  }

  Widget listItem(BuildContext context, int index){
    var currentFeature = FeatureEnum.values[index];
    return GestureDetector(
      onTap: currentFeature.onTap(context),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        height: 70,
        alignment: Alignment.center,
        child: Text(currentFeature.name, style: const TextStyle(
          fontSize: 20,
        ),),
      ),
    );
  }
}

enum FeatureEnum{
  image('/image', 'image non cache'),
  imageCache('/imageCache', 'image cache');

  final String route;
  final String name;
  const FeatureEnum(this.route, this.name);

}
extension FeatureEnumExtention on FeatureEnum{
  VoidCallback onTap(BuildContext context) => (){Navigator.pushNamed(context, route);};
}