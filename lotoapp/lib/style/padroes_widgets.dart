import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // <-- Radius
          ),
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
