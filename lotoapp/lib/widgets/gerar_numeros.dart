/*import 'dart:core';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

import 'quina_wiget.dart';

class GerarNumeros {
  
  var numbers = Set<int>();
  var listadePalpites = Set<List>();
  int length = 5;
  int max = 80;
  int min = 1;
  int tamanho = 5;
  List<int> listnumbers = List<int>.filled(5, 0, growable: true);

  GerarNumeros() {
    SetState(() {
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
    print(listnumbers);
    });
}
*/