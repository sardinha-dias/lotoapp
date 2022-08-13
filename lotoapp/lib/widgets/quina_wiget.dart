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
      primary: false,
      backgroundColor: Colors.redAccent,
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
          Text('$length'),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
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
