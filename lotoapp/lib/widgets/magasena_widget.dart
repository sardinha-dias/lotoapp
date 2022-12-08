import 'dart:math';
import 'package:flutter/material.dart';
import '../style/bolas_sorteadas.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'main_menu_widget.dart';

class MegaSenaWidget extends StatefulWidget {
  const MegaSenaWidget({Key? key}) : super(key: key);

  @override
  State<MegaSenaWidget> createState() => _MegaSenaWidgetState();
}

class _MegaSenaWidgetState extends State<MegaSenaWidget> {
  int _selectedIndex = 0;

  final ScrollController _firstController = ScrollController();

  var numbers = <int>{};
  var listadePalpites = <List>{};
  int length = 6;
  int max = 60;

  List<int> listnumbers = List<int>.filled(6, 0, growable: true);

  void _gera() {
    setState(() {
      int nextNumber({required int max}) => 1 + Random().nextInt(max);
      while (numbers.length < length) {
        final number = nextNumber(max: max);
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
        listnumbers = List<int>.filled(length, 0, growable: true);
      } else {
        Fluttertoast.showToast(
            msg: "O número máximo de números para apostar é 15",
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
      if (length > 6) {
        length--;
        listnumbers = List<int>.filled(length, 0, growable: true);
      } else {
        Fluttertoast.showToast(
            msg: "O número mínimo de números para apostar é 6",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      index == 0
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MainMenuWidget())) //  showModal(context)
          : index == 1
              ?
              //    void showModal(BuildContext context) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('Example Dialog'),
                    actions: <TextButton>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      )
                    ],
                  ),
                )
              : showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('Exertetedfdfsdfsdfg'),
                    actions: <TextButton>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      )
                    ],
                  ),
                );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/back_menu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            //    opacity: 1.0
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 2.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      itemCount: length,
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
                height: 100,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Quantidade de números',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Text(
                            '$length',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                    ],
                  ),
                ),
              ),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: ListView.builder(
                        controller: _firstController,
                        itemCount: listadePalpites.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BolasGeradas(
                              sequenciaDeBolas:
                                  listadePalpites.elementAt(index));
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Salvar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Sorte',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
