import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/loto_widget.dart';
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
    return MaterialApp(
      routes: {
        // '/': (context) => LotoApp(),

        //  '/Quina': (context) => const QuinaWidget(),
        //    '/Megasena': (context) => const QuinaWidget(),
        //   '/Lotomania': (context) => const QuinaWidget(),
        //   '/Lotofacil': (context) => const QuinaWidget(),
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
