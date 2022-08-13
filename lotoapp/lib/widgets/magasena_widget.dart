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
      primary: false,
      backgroundColor: Colors.yellowAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(onPressed: _gera, child: Text('botão')),
          Expanded(
            //  child: Container(
            //   decoration: BoxDecoration(color: Colors.lightGreen),
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
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
          Text('$length'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _decrementa,
                child: const Icon(Icons.arrow_back_rounded),
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: _incrementa,
                child: const Icon(Icons.arrow_forward_sharp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
