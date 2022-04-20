import 'package:flutter/material.dart';

class FlutterEurope2020Demo1 extends StatefulWidget {
  const FlutterEurope2020Demo1({Key? key}) : super(key: key);

  @override
  State<FlutterEurope2020Demo1> createState() => _FlutterEurope2020Demo1State();
}

class _FlutterEurope2020Demo1State extends State<FlutterEurope2020Demo1>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 250).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxSlide = 200.0;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double scale = 1 - (animationController.value * 0.3);
    double slide = maxSlide * animationController.value;
    return Scaffold(
        body: AnimatedBuilder(
            animation: animationController,
            builder: (_, __) {
              return GestureDetector(
                onTap: toggle,
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      color: Colors.yellow,
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..translate(slide)
                        ..scale(scale),
                      child: Container(
                        // height: height,
                        // width: width,
                        alignment: Alignment.centerRight,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  toggle() {
    setState(() {
      animationController.isDismissed
          ? animationController.forward()
          : animationController.reverse();
    });
  }
}
