import 'package:flutter/material.dart';

class ChangingBoxAnimation extends StatefulWidget {
  const ChangingBoxAnimation({Key? key}) : super(key: key);

  @override
  State<ChangingBoxAnimation> createState() => _ChangingBoxAnimationState();
}

class _ChangingBoxAnimationState extends State<ChangingBoxAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    colorAnimation = ColorTween(begin: Colors.green, end: Colors.blue).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    sizeAnimation = Tween<double>(begin: 100, end: 200).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));
        animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
          builder: (_, __) => Align(
                alignment: Alignment.center,
                child: Container(
                  color: colorAnimation.value,
                  height: sizeAnimation.value,
                  width: sizeAnimation.value,
                ),
              )),
    );
  }
}
