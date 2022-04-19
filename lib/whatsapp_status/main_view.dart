import 'package:animations_demo/whatsapp_status/widgets/build_body.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_lorem/flutter_lorem.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  PageController pageController = PageController(
    initialPage: 0,
  );
  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void initState() {
    onModelReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation,
        builder: (_, child) {
          return PageView.builder(
            controller: pageController,
            onPageChanged: (int page) {
              print("Page Chnaged: $page");
              animationController.forward();
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              return const BuildBody();
            },
          );
        },
      ),
    );
  }
}

List<String> items = [
  lorem(words: 100),
  lorem(words: 10),
  lorem(words: 50),
  lorem(words: 89),
  lorem(words: 76),
];
