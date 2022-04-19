import 'package:flutter/material.dart';

class CountDownAnimation extends StatefulWidget {
  const CountDownAnimation({Key? key}) : super(key: key);

  @override
  State<CountDownAnimation> createState() => _CountDownAnimationState();
}

class _CountDownAnimationState extends State<CountDownAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<int> animation;
  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = IntTween(begin: 100, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));
    animationController.forward();
  }

  @override
  void initState() {
    onModelReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: AnimatedBuilder(
            animation: animation,
            builder: (_, __) {
              return Text(animation.value.toString());
            }),
      ),
    );
  }
}
