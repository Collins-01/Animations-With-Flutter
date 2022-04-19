import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  const DelayedAnimation({Key? key}) : super(key: key);

  @override
  State<DelayedAnimation> createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation miniDelayedANimation;
  late Animation superDelayedAnimation;
  late Animation rightToLeft;

  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween(begin: -0.9, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutCirc),
    );
    miniDelayedANimation = Tween(begin: -1.0, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutCirc),
    );
    superDelayedAnimation = Tween(begin: 0.9, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutCirc),
    );
    rightToLeft = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOutCirc),
    );
    animationController.forward();
  }

  @override
  void initState() {
    onModelReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: animation,
              builder: (_, child) {
                return Transform(
                  transform:
                      Matrix4.translationValues(0, animation.value * height, 0),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: miniDelayedANimation,
              builder: (_, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      miniDelayedANimation.value * width, 0, 0),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: superDelayedAnimation,
              builder: (_, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      0, superDelayedAnimation.value * height, 0),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: rightToLeft,
              builder: (_, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      rightToLeft.value * width, 0, 0),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
