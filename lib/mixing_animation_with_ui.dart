import 'package:flutter/material.dart';

class MixingAnimationsWithUI extends StatefulWidget {
  const MixingAnimationsWithUI({Key? key}) : super(key: key);

  @override
  State<MixingAnimationsWithUI> createState() => _MixingAnimationsWithUIState();
}

class _MixingAnimationsWithUIState extends State<MixingAnimationsWithUI>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    animation = Tween<double>(begin: 10, end: 200).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    // animationController.forward();
  }

  @override
  void initState() {
    onModelReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animation,
        builder: (_, __) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                  child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap: () {
                      animationController.forward();
                    },
                    child: Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        transform: Matrix4.translationValues(
                            0, animation.value * width, 0),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            animationController.forward();
                          }, child: const Text("Share")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Delete")),
                    ],
                  ),
                ],
              )),
            ),
          );
        });
  }
}
