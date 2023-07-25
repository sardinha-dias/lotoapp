import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/botao_menu.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          //  color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: const AssetImage("assets/back_menu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            //    opacity: 1.0
          ),
        ),
        child: const Column(
          children: [
            SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 15,
            ),
            BotaoMenu(
              jogo: 'Quina',
              logo: 'assets/logo-quina.png',
              passar: 'quina',
            ),
            SizedBox(
              height: 10,
            ),
            BotaoMenu(
              jogo: 'Megasena',
              logo: 'assets/logo-megasena.png',
              passar: 'megasena',
            ),
            SizedBox(
              height: 10,
            ),
            BotaoMenu(
              jogo: 'Lotofácil',
              logo: 'assets/logo-lotofacil.png',
              passar: 'lotofacil',
            ),
            SizedBox(
              height: 10,
            ),
            BotaoMenu(
              jogo: 'Lotomania',
              logo: 'assets/logo-lotomania.png',
              passar: 'lotomania',
            ),
          ],
        ),
      ),
    );
  }
}
