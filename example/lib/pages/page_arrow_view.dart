import 'package:flutter/material.dart';

class PageArrowView extends StatefulWidget {
  final PageController pageController;
  const PageArrowView({Key? key, required this.pageController}) : super(key: key);

  @override
  State<PageArrowView> createState() => _PageArrowViewState();
}

class _PageArrowViewState extends State<PageArrowView> {

  final Duration _duration = const Duration(milliseconds: 100);
  final Curve _curve = Curves.linear;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => widget.pageController.previousPage(duration: _duration, curve: _curve),
              child: const Icon(Icons.arrow_left, size: 40)),
          const Spacer(),
          GestureDetector(
              onTap: () => widget.pageController.nextPage(duration: _duration, curve: _curve),
              child: const Icon(Icons.arrow_right, size: 40)),        ],
      ),
    );
  }
}
