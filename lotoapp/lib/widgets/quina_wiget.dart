import 'dart:math';
import 'package:flutter/material.dart';
import '../style/bolas_sorteadas.dart';


class QuinaWidget extends StatefulWidget {
  const QuinaWidget({Key? key}) : super(key: key);

  @override
  State<QuinaWidget> createState() => _QuinaWidgetState();
}

class _QuinaWidgetState extends State<QuinaWidget> {
  var numbers = Set<int>();
  int init = 1;
  int length = 10;
  int max = 20;
  int min = 1;

  @override
  Widget build(BuildContext context) {
    int nextNumber({required int max, required int min}) =>
        min + Random().nextInt(max - min + 1);
    while (numbers.length < length) {
      final number = nextNumber(max: max, min: min);
      numbers.add(number);
    }
    List listnumbers = numbers.toList();
    listnumbers.sort();
    if (init == 0) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (BuildContext context, int index) {
            return BolasSorteadas(
              sequencia: 0,
            );
          });
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
        ),
        itemCount: listnumbers.length,
        itemBuilder: (BuildContext context, int index) {
          return BolasSorteadas(
            sequencia: listnumbers.elementAt(index),
          );
        },
      );
    }
  }
}




    // final number = nextNumber(max: max, min: min);
    // min + Random().nextInt(max - min + 1);
    // print(number);
    //  int nextNumbers(
    //   {required int length, required int min, required int max}) =>
    //    Random().nextInt(max - min);

    //final list = List<int>.generate(
    //  length, (_) => nextNumbers(length: length, max: max, min: min));
    //  print(list);
    //  print(list.length);
    // numbers = Set<int>();
    // numberso = Set<int>();
