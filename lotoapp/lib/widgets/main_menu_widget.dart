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
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: const AssetImage("assets/back_menu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            //    opacity: 1.0
          ),
        ),
        child: Column(
          children: const [
            SizedBox(
              height: 150,
            ),
            Text('escolha uma das modalidades Abaixo para gerar os números',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
            SizedBox(
              height: 15,
            ),
            BotaoMenu(
              jogo: 'Quina',
              logo: 'assets/logo-lotofacil.png',
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
              jogo: 'Lotomania',
              logo: 'assets/logo-lotomania.png',
              passar: 'lotomania',
            ),
            SizedBox(
              height: 10,
            ),
            BotaoMenu(
              jogo: 'Lotofácio',
              logo: 'assets/logo-lotofacil.png',
              passar: 'lotofacil',
            ),
          ],
        ),
      ),
    );
  }
}
