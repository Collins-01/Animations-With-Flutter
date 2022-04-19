import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: -0.05, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform:
                  Matrix4.translationValues(0, animation.value * height, 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Transform(
              transform:
                  Matrix4.translationValues(animation.value * width, 0, 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
