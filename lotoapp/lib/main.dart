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
    int nextNumber({required int max, required int min}) =>
        min + Random().nextInt(max - min + 1);

    final number = nextNumber(max: 20, min: 10);
    // min + Random().nextInt(max - min + 1);
    print(number);

    // List<int> nextNumbers(int length, {required int min, required int max}) =>
    //     Random().nextInt(max - min);

    //final list = List<int>.generate(10,(_)=> nextNumbers(10, max: 20, min: 5));

    //  print(list);

    final numbers = Set<int>();

    // while (numbers.length < length) {
    //  final numbers = nextNumber(max: max, min: min);

    //  numbers.add(numbers);
    //   }
    //  return numbers;

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
