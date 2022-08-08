import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/lotomania_widget.dart';
import 'package:lotoapp/widgets/main_menu_widget.dart';
import 'package:lotoapp/widgets/quina_wiget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = 50;
    int max = 100;
    int min = 1;

    int nextNumber({required int max, required int min}) =>
        min + Random().nextInt(max - min + 1);

    final number = nextNumber(max: max, min: min);
    // min + Random().nextInt(max - min + 1);
    print(number);

    int nextNumbers(
            {required int length, required int min, required int max}) =>
        Random().nextInt(max - min);

    final list = List<int>.generate(
        length, (_) => nextNumbers(length: length, max: max, min: min));

    print(list);
    print(list.length);

    final numbers = Set<int>();

    while (numbers.length < list.length) {
      final number = nextNumber(max: max, min: min);

      numbers.add(number);
    }
    //   return number;
    print(numbers);
    return MaterialApp(
      routes: {
        // '/': (context) => LotoApp(),

        '/tela2': (context) => const QuinaWidget()
      },
      home: const LotoApp(),
    );
  }
}

class LotoApp extends StatelessWidget {
  const LotoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 228, 24),
      appBar: AppBar(
        title: Text(
          'Palpite Certo',
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 228, 24),
      ),
      body: const MainMenuWidget(),
    );
  }
}
