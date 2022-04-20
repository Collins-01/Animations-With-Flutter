import 'package:flutter/material.dart';

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({Key? key}) : super(key: key);

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation colorAnimation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    sizeAnimation = Tween<double>(begin: 50, end: 250).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    colorAnimation =
        ColorTween(begin: Colors.pink, end: Colors.pink.withOpacity(.8))
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.bounceOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: sizeAnimation,
            builder: (_, __) {
              return GestureDetector(
                onTap: _toggle,
                child: Container(
                  height: sizeAnimation.value,
                  width: sizeAnimation.value,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    shape: BoxShape.circle,
                    color: colorAnimation.value,
                  ),
                  child: Icon(
                    animationController.isDismissed ? Icons.menu : Icons.close,
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }

  _toggle() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }
}
