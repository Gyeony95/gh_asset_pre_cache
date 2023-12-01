import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgNonCachePage extends StatelessWidget {
  const SvgNonCachePage({Key? key}) : super(key: key);

  static const List<String> _svgNonCacheList = [
    'assets/svgs/free_svg_1.svg',
    'assets/svgs/free_svg_2.svg',
    'assets/svgs/free_svg_3.svg',
    'assets/svgs/free_svg_4.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        ...List.generate(_svgNonCacheList.length, (index) =>
            SvgPicture.asset(_svgNonCacheList[index], width: double.infinity,
              fit: BoxFit.fitWidth,),),
      ],
    );
  }
}
