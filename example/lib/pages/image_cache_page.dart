import 'package:example/pages/page_arrow_view.dart';
import 'package:example/pages/resource.dart';
import 'package:flutter/material.dart';

class ImageCachePage extends StatefulWidget {
  const ImageCachePage({Key? key}) : super(key: key);

  @override
  State<ImageCachePage> createState() => _ImageCachePageState();
}

class _ImageCachePageState extends State<ImageCachePage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(imageCacheList.length, (index) =>
                  Image.asset(imageCacheList[index], width: double.infinity,
                    fit: BoxFit.fitWidth,),),
            ],
          ),
        ),
        PageArrowView(pageController: pageController),
      ],
    );
  }
}
