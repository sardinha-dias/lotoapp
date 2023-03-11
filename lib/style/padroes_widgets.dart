import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
