import 'package:flutter/material.dart';
//import 'package:lotoapp/widgets/quina_wiget.dart';

class BolasSorteadas extends StatelessWidget {
  final int? sequencia;

  const BolasSorteadas({
    super.key,
    this.sequencia,
  });
  final double imageRadius = 17;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        backgroundColor: Colors.black87,
        radius: imageRadius - 0.4,
        child: Text(
          sequencia.toString(),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class BolasGeradas extends StatelessWidget {
  final List? sequenciaDeBolas;

  const BolasGeradas({
    super.key,
    this.sequenciaDeBolas,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          sequenciaDeBolas.toString(),
          style: const TextStyle(
              wordSpacing: 4.0,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
      ),
    );
  }
}
