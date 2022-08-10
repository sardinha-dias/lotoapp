import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/quina_wiget.dart';

class BolasSorteadas extends StatelessWidget {
  final int? sequencia;

  // 1
  BolasSorteadas({
    this.sequencia,
  });
  // 2
  final double imageRadius = 15;
  @override
  Widget build(BuildContext context) {
    // 3
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      // 4
      child: CircleAvatar(
        radius: imageRadius - 1,
        child: Text(sequencia.toString()),
      ),
    );
  }
}
