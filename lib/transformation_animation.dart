import 'package:flutter/material.dart';

class TransformAnimations extends StatefulWidget {
  const TransformAnimations({Key? key}) : super(key: key);

  @override
  State<TransformAnimations> createState() => _TransformAnimationsState();
}

class _TransformAnimationsState extends State<TransformAnimations>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> parentAnimation;
  late Animation transfromAnimation;
  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    parentAnimation = Tween<double>(begin: 10, end: 200).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    transfromAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(125.0),
            end: BorderRadius.circular(0.0))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();
  }

  @override
  void initState() {
    onModelReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: parentAnimation,
        builder: (_, __) {
          return Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: Container(
                height: parentAnimation.value,
                width: parentAnimation.value,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: transfromAnimation.value,
                ),
              ),
            ),
          );
        });
  }
}
