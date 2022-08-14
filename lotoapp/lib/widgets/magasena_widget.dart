import 'dart:math';
import 'package:flutter/material.dart';
import '../style/bolas_sorteadas.dart';

class MegaSenaWidget extends StatefulWidget {
  const MegaSenaWidget({Key? key}) : super(key: key);

  @override
  State<MegaSenaWidget> createState() => _MegaSenaWidgetState();
}

class _MegaSenaWidgetState extends State<MegaSenaWidget> {
  var numbers = Set<int>();
  int length = 6;
  int max = 60;
  int min = 1;
  List<int> listnumbers = List<int>.filled(6, 0, growable: true);

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
      if (length < 15) {
        length++;
      }
    });
  }

  void _decrementa() {
    setState(() {
      if (length > 6) {
        length--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Expanded(
            flex: 2,
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
          SizedBox(
            height: 5,
          ),
          Text(
            'Quantidade de números',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementa,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '$length',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: _incrementa,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _gera,
              child: Text(
                'Gerar Números',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 50,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ),
        ],
      ),
    );
  }
}
