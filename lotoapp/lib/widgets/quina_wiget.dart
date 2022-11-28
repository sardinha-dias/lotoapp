import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import '../style/bolas_sorteadas.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuinaWidget extends StatefulWidget {
  const QuinaWidget({Key? key}) : super(key: key);

  @override
  State<QuinaWidget> createState() => _QuinaWidgetState();
}

class _QuinaWidgetState extends State<QuinaWidget> {
  var numbers = Set<int>();
  var listadePalpites = Set<List>();
  int length = 5;
  int max = 80;
  int min = 1;
  int tamanho = 5;
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

      listadePalpites.add(listnumbers);
      numbers.clear();
    });
  }

  void _incrementa() {
    setState(() {
      if (length < 15) {
        length++;
        tamanho = length;
        listnumbers = List<int>.filled(tamanho, 0, growable: true);
      } else {
        Fluttertoast.showToast(
            msg: "O quantidade máximo de números para apostar é 15",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  void _decrementa() {
    setState(() {
      if (length > 5) {
        length--;
        tamanho = length;

        listnumbers = List<int>.filled(tamanho, 0, growable: true);
      } else {
        Fluttertoast.showToast(
            msg: "O quantidade mínima de números para apostar é 5",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 1.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Quantidade de números',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(18.0), // <-- Radius
                              ),
                            ),
                            onPressed: _decrementa,
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '$length',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(18.0), // <-- Radius
                              ),
                            ),
                            onPressed: _incrementa,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18.0), // <-- Radius
                        ),
                      ),
                      onPressed: _gera,
                      child: const Text(
                        'Gerar Números',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
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
                      height: 30,
                      child: Text(listadePalpites.elementAt(index).toString()),
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Expanded(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // <-- Radius
                ),
              ),
              child: const Text('Voltar'),
            ),
          ),
        ],
      ),
    );
  }
}
