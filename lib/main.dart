import 'package:animations_demo/count_down_animation.dart';
import 'package:animations_demo/delayed_animations.dart';
import 'package:animations_demo/demo1.dart';
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
      home: const CountDownAnimation(),
    );
  }
}
