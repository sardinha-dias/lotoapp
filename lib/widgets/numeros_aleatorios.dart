import 'dart:math';
import 'quina_widget.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NumerosAleatorios {
// late final Box box;
//  int _selectedIndex = 0;
  // final ScrollController _firstController = ScrollController();

  // List<dynamic> salvo = [];
  var numbers = <int>{};
  List<dynamic> listadePalpites = [];
  late int length;
  late int max;
  late List<int> listnumbers;
  // void setJogo(int quina, int maxquina) {
  //   length = quina;
  //  max = maxquina;
  //   listnumbers = List<int>.filled(5, 0, growable: true);
  // }

  void gera(int max, int lenght, int nunbers) {
    int nextNumber({required int max}) => 1 + Random().nextInt(max);
    while (numbers.length < length) {
      final number = nextNumber(max: max);
      numbers.add(number);
    }
    listnumbers = numbers.toList();
    listnumbers.sort();
    //listadePalpites.add(listnumbers);
    // numbers.clear();
    // notifyListeners();
  }

  void incrementa() {
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
  }

  void decrementa() {
    if (length > 5) {
      length--;
      listnumbers = List<int>.filled(length, 0, growable: true);
    } else {
      Fluttertoast.showToast(
          msg: "O número mínimo de números para apostar é 5",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // void _onItemTapped(int index) {
  //     _selectedIndex = index;
  //     index == 0
  //         ? Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) =>
  //                     const MainMenuWidget())) //  showModal(context)
  //         : index == 1
  //             ?
  //             //    void showModal(BuildContext context) {
  //             showDialog(
  //                 context: context,
  //                 builder: (BuildContext context) => AlertDialog(
  //                   content: const Text('Example Dialog'),
  //                   actions: <TextButton>[
  //                     TextButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: const Text('Close'),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             : showDialog(
  //                 context: context,
  //                 builder: (BuildContext context) => AlertDialog(
  //                   content: const Text('Exertetedfdfsdfsdfg'),
  //                   actions: <TextButton>[
  //                     TextButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: const Text('Close'),
  //                     )
  //                   ],
  //                 ),
  //               );
  // }
}
