import 'package:flutter/material.dart';

class LotomaniaWidget extends StatefulWidget {
  const LotomaniaWidget({Key? key}) : super(key: key);

  @override
  State<LotomaniaWidget> createState() => _LotomaniaWidgetState();
}

class _LotomaniaWidgetState extends State<LotomaniaWidget> {
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
