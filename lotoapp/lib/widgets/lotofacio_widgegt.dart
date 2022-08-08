import 'package:flutter/material.dart';

class LotofacioWidget extends StatefulWidget {
  LotofacioWidget({Key? key}) : super(key: key);

  @override
  State<LotofacioWidget> createState() => _LotofacioWidgetState();
}

class _LotofacioWidgetState extends State<LotofacioWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: 5.0,
        );
      },
    );
  }
}