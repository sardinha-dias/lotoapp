import 'package:flutter/material.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            icon: Image.asset('assets/logo-lotofacil.png'),
            onPressed: () {
              Navigator.of(context).pushNamed('/tela2');
            }), 
        TextButton(child: const Text('Lotofacio'), onPressed: () {}),
        ElevatedButton(
          child: const Text(
            'Megasena',
          ),
          onPressed: () {},
        ),
        ElevatedButton(
          child: const Text('Quina'),
          onPressed: () {},
        )
      ],
    );
  }
}
