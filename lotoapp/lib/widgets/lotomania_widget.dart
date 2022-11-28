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
  var listadePalpites = Set<List>();

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
      listadePalpites.add(listnumbers);

      numbers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 260,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                        style: BorderStyle.solid)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Center(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: Column(
                    children: [
                      const Text(
                        'Quantidade de números',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$length',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0), // <-- Radius
              ),
            ),
            onPressed: _gera,
            child: const Text(
              'Gerar Números',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.transparent,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: listadePalpites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                      child: Text(listadePalpites.elementAt(index).toString()),
                    );
                  }),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // <-- Radius
                ),
              ),
              child: const Text(
                'Voltar',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
