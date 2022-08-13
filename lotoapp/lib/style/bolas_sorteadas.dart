import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/quina_wiget.dart';

class BolasSorteadas extends StatelessWidget {
  final int? sequencia;

  BolasSorteadas({
    this.sequencia,
  });
  final double imageRadius = 15;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        backgroundColor: Colors.black54,
        radius: imageRadius - 1,
        child: Text(
          sequencia.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
