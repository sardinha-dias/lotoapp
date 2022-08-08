import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LotoApp(),
    );
  }
}

class LotoApp extends StatelessWidget {
  const LotoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 228, 24),
      appBar: AppBar(
        title: Text(
          'Palpite Certo',
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 13, 228, 24),
      ),
      body: BolasEscolhidas(),
    );
  }
}

class BolasEscolhidas extends StatefulWidget {
  const BolasEscolhidas({Key? key}) : super(key: key);

  @override
  State<BolasEscolhidas> createState() => _BolasEscolhidasState();
}

class _BolasEscolhidasState extends State<BolasEscolhidas> {
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

//class Bolas {




