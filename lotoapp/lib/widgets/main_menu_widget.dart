import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/quina_wiget.dart';

import 'lotofacio_widgegt.dart';
import 'lotomania_widget.dart';
import 'magasena_widget.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back_menu.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuinaWidget()),
                );
              },
              child: (Card(
                elevation: 1.5,
                color: Colors.transparent,
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset('assets/logo-quina.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Quina',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MegaSenaWidget()),
                );
              },
              child: (Card(
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset('assets/logo-megasena.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Megasena',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LotomaniaWidget()),
                );
              },
              child: (Card(
                elevation: 1.5,
                color: Colors.transparent,
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset('assets/logo-lotomania.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Lotomania',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LotofacioWidget()),
                );
              },
              child: (Card(
                elevation: 1.5,
                color: Colors.transparent,
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset('assets/logo-lotofacil.png'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Lotofácil',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
            )
          ],
        ),
        /* add child content here */
      ),
    );
  }
}
