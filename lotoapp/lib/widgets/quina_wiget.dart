import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/main_menu_widget.dart';
import '../style/bolas_sorteadas.dart';

class QuinaWidget extends StatefulWidget {
  const QuinaWidget({Key? key}) : super(key: key);

  @override
  State<QuinaWidget> createState() => _QuinaWidgetState();
}

class _QuinaWidgetState extends State<QuinaWidget> {
  var numbers = Set<int>();
  int length = 5;
  int max = 80;
  int min = 1;
  List<int> listnumbers = List<int>.filled(5, 0, growable: true);

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
      } else {
        print('aposta maxima');
      }
    });
  }

  void _decrementa() {
    setState(() {
      if (length > 5) {
        length--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade400,
        title: const Text('Palpites para a Quina')),
      backgroundColor: Colors.green.shade400,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 60,
        ),
        Expanded(
          flex: 1,
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
              const SizedBox(
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
          ),
        ),
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
      ]),
    );
  }
}
