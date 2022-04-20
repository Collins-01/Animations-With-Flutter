import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    sizeAnimation = Tween<double>(begin: 16, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));
    // animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (_, __) => Align(
                alignment: Alignment.center,
                child: Transform.scale(

                  scale: 1,
                  child: IconButton(
                    onPressed: _toggle,
                    icon: Icon(
                      Icons.favorite,
                      color: colorAnimation.value,
                      size: sizeAnimation.value,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  _toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}
