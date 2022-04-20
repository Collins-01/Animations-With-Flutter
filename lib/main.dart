import 'package:animations_demo/animated_menu.dart';
import 'package:animations_demo/changing_box_animation.dart';
import 'package:animations_demo/count_down_animation.dart';
import 'package:animations_demo/delayed_animations.dart';
import 'package:animations_demo/demo1.dart';
import 'package:animations_demo/flutter_europe_2020_demo1.dart';
import 'package:animations_demo/like_button.dart';
import 'package:animations_demo/mixing_animation_with_ui.dart';
import 'package:animations_demo/parent_animation.dart';
import 'package:animations_demo/transformation_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedMenu(),
    );
  }
}
