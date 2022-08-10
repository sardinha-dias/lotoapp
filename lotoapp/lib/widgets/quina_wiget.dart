import 'dart:math';

import 'package:flutter/material.dart';

import '../style/bolas_sorteadas.dart';

var numbers = Set<int>();
//var numberso = Set<int>();

class QuinaWidget extends StatefulWidget {
  const QuinaWidget({Key? key}) : super(key: key);

  @override
  State<QuinaWidget> createState() => _QuinaWidgetState();
}

class _QuinaWidgetState extends State<QuinaWidget> {
  @override
  Widget build(BuildContext context) {
    int length = 50;
    int max = 100;
    int min = 1;

    int nextNumber({required int max, required int min}) =>
        min + Random().nextInt(max - min + 1);

    final number = nextNumber(max: max, min: min);
    // min + Random().nextInt(max - min + 1);
    // print(number);

    int nextNumbers(
            {required int length, required int min, required int max}) =>
        Random().nextInt(max - min);

    final list = List<int>.generate(
        length, (_) => nextNumbers(length: length, max: max, min: min));

    //  print(list);
    //  print(list.length);

    // numbers = Set<int>();
    // numberso = Set<int>();

    while (numbers.length < list.length) {
      final number = nextNumber(max: max, min: min);

      numbers.add(number);

      List listnumbers = numbers.toList();
      listnumbers.sort();

      print(listnumbers);

      // Set numberso = listnumbers.toSet();
    }

    //   return number;
    // print(numbers);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
      ),
      itemCount: numbers.length,
      itemBuilder: (BuildContext context, int index) {
        return BolasSorteadas(
          sequencia: numbers.elementAt(index),
        );
      },
    );
  }
}
