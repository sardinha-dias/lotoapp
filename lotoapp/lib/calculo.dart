import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';

class Calculo extends StatefulWidget {
  const Calculo({Key? key}) : super(key: key);

  @override
  State<Calculo> createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    final lista = List.generate(50, (index) => null);

    print(lista);
  }
}
