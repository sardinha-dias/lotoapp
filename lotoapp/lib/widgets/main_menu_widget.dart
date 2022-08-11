import 'package:flutter/material.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Expanded(
              child: OutlinedButton.icon(
                icon: Expanded(
                  child: Image.asset(
                    '/lotoapp/assets/logo-lotofacil.png',
                    scale: 10,
                  ),
                ),
            
                label: Text('Lotomania'),
            
                // style: OutlinedButton.icon(
                //     minimumSize: Size(280, 80),
                //     textStyle: TextStyle(fontSize: 28),
                //   primary: Colors.orange,
                // onPrimary: Colors.black,
                //    ),
                //  child: Text('FlatButton Ativo'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
