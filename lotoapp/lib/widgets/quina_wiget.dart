import 'package:flutter/material.dart';

class QuinaWidget extends StatefulWidget {
  const QuinaWidget({Key? key}) : super(key: key);

  @override
  State<QuinaWidget> createState() => _QuinaWidgetState();
}

class _QuinaWidgetState extends State<QuinaWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: 5.0,
        );
      }, 
      
    );
  }
}
