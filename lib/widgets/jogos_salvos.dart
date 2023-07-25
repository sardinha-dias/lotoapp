import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../style/bolas_sorteadas.dart';

class JogosSalvos extends StatefulWidget {
  const JogosSalvos({super.key});

  @override
  State<JogosSalvos> createState() => _JogosSalvosState();
}

class _JogosSalvosState extends State<JogosSalvos> {
  late final Box box;
  List<dynamic> salvo = [];
  final ScrollController _firstController = ScrollController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    box = Hive.box('jogosSalvos');
  }

  //@override
// void dispose() {
  //  Hive.close();
  //   super.dispose();
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      index == 0
          ? Navigator.pop(context)

          // push(
          //    context,
          //     MaterialPageRoute(
          //          builder: (context) =>
          //             const MainMenuWidget())) //  showModal(context)
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

  _deletaJogos() {
    for (int i = 0; i < salvo.length + 1; i++) {
      box.deleteAt(i);

      // setState(() {
      //    _listaJogos();
      //  });

      print(salvo.length);
    }
  }

  _listaJogos() {
    // setState(() {
    //  Hive.openBox('jogosSalvos');
    for (int i = 0; i < box.length; i++) {
      salvo.add(box.getAt(i));
    }
    print('Info retrived from box: $salvo ');
    print(salvo.length);
    //  });
  }

  @override
  Widget build(BuildContext context) {
    _listaJogos();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _deletaJogos,
            child: const Text('Apagar Jogos'),
          ),
          Expanded(
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
                      itemCount: box.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BolasGeradas(
                          sequenciaDeBolas: salvo.elementAt(index),
                        );
                      }),
                ),
              ),
            ),
          ),
        ],
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
