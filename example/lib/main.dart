import 'package:flutter/material.dart';

void main() {
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
        FeatureEnum.svg.route: (context) => const SizedBox(),
        FeatureEnum.svgCache.route: (context) => const SizedBox(),
        FeatureEnum.image.route: (context) => const SizedBox(),
        FeatureEnum.imageCache.route: (context) => const SizedBox(),
      },
    );
  }
}

class FeatureList extends StatefulWidget {
  const FeatureList({Key? key}) : super(key: key);

  @override
  State<FeatureList> createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

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
  svg('/svgs', 'svg non cache'),
  svgCache('/svgCache', 'svg cache'),
  image('/image', 'image non cache'),
  imageCache('/imageCache', 'image cache');

  final String route;
  final String name;
  const FeatureEnum(this.route, this.name);

}
extension FeatureEnumExtention on FeatureEnum{
  VoidCallback onTap(BuildContext context) => (){Navigator.pushNamed(context, route);};
}