import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: -1, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInSine));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          onPageChanged: (page){
            animationController.forward();
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(
                  items[index]['image']!,
                  fit: BoxFit.contain,
                ),
                Text(items[index]['title']!)
              ],
            );
          },
        ),
      ),
    );
  }
}

List<Map<String,String>> items = [
  {
    "title": lorem(words: 1),
    "description": lorem(words: 16),
    "image": "assets/onboardings/onboarding1.jpeg"
  }
];
