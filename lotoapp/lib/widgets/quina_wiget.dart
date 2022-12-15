import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
//import 'package:lotoapp/widgets/jogos_salvos.dart';
//import 'package:lotoapp/widgets/gerar_numeros.dart';
//import 'package:lotoapp/widgets/main_menu_widget.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import '../style/bolas_sorteadas.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:lotoapp/widgets/numeros_aleatorios.dart';

class QuinaWidget extends StatelessWidget {
  QuinaWidget({Key? key}) : super(key: key);
  final ScrollController _firstController = ScrollController();

//  late final Box box;
  @override
  Widget build(BuildContext context) {
    print('build');
    final contador = Provider.of<NumerosAleatorios>(context);
    // final numeroDeBolas = Provider.of<NumerosAleatorios>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.format_list_numbered_sharp),
            tooltip: 'Jogos Salvos',
          ),
        ],
      ),
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
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10,
                    ),
                    itemCount: contador.listnumbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BolasSorteadas(
                        sequencia: contador.listnumbers.elementAt(index),
                      );
                    },
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
                    //  mainAxisAlignment: MainAxisAlignment.start,
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
                            onPressed: contador.decrementa,
                            child: const Icon(Icons.remove),
                          ),
                          Text(
                            contador.listnumbers.length.toString(),
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
                            onPressed: contador.incrementa,
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
              onPressed: contador.gera,
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
                        itemCount: contador.listadePalpites.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BolasGeradas(
                            sequenciaDeBolas:
                                contador.listadePalpites.elementAt(index),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.save),
      //       label: 'Salvar',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.money),
      //       label: 'Sorte',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
      //  );
    );
  }
}
