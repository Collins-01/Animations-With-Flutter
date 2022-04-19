import 'package:flutter/material.dart';

class ParentAnimationWidget extends StatefulWidget {
  const ParentAnimationWidget({Key? key}) : super(key: key);

  @override
  State<ParentAnimationWidget> createState() => _ParentAnimationWidgetState();
}

class _ParentAnimationWidgetState extends State<ParentAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> childAnimation;
  late Animation parentAnimation;

  onModelReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    parentAnimation = Tween(begin: -0.01, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    childAnimation = childAnimation = Tween<double>(begin: 20.0, end: 170)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
   
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
    
    animationController.forward();
    return AnimatedBuilder(
        animation: parentAnimation,
        builder: (_, __) {
          return Scaffold(
            body: Align(
              alignment: Alignment.center,
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Transform(
                  transform: Matrix4.translationValues(
                      parentAnimation.value * width, 0, 0),
                  child: Container(
                    height: childAnimation.value * 2,
                    width: childAnimation.value * 2,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
//  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AnimatedBuilder(
//                         animation: childAnimation,
//                         builder: (_, __) {
//                           return Center(
//                             child: Container(
//                               height: childAnimation.value * 2,
//                               width: childAnimation.value * 2,
//                               color: Colors.blue,
//                             ),
//                           );
//                         })
//                   ],
//                 ),