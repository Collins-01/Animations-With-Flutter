import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  final status = lorem(words: 100);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.07, left: 16),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Heisenberg",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.07,
                    left: width * 0.1,
                    right: width * 0.1,
                    bottom: height * 0.1),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
