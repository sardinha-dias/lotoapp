import 'dart:math';
import 'package:flutter/material.dart';
import '../style/bolas_sorteadas.dart';

class LotomaniaWidget extends StatefulWidget {
  const LotomaniaWidget({Key? key}) : super(key: key);

  @override
  State<LotomaniaWidget> createState() => _LotomaniaWidgetState();
}

class _LotomaniaWidgetState extends State<LotomaniaWidget> {
  var numbers = Set<int>();
  int length = 50;
  int max = 100;
  int min = 1;
  List<int> listnumbers = List<int>.filled(50, 0, growable: true);

  void _gera() {
    setState(() {
      int nextNumber({required int max, required int min}) =>
          min + Random().nextInt(max - min + 1);
      while (numbers.length < length) {
        final number = nextNumber(max: max, min: min);
        numbers.add(number);
      }
      listnumbers = numbers.toList();
      listnumbers.sort();
      numbers.clear();
    });
  }

  void _incrementa() {
    setState(() {
      length++;
    });
  }

  void _decrementa() {
    setState(() {
      length--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: const Text('Palpites para Lotomania'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 6,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
              ),
              itemCount: listnumbers.length,
              itemBuilder: (BuildContext context, int index) {
                return BolasSorteadas(
                  sequencia: listnumbers.elementAt(index),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Text(
              'Números escolhidos  $length',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: _gera, child: Text('Gerar Números'))),
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ),
          SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }
}
