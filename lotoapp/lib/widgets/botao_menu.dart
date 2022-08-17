import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lotoapp/widgets/lotofacio_widgegt.dart';
import 'package:lotoapp/widgets/magasena_widget.dart';
import 'package:lotoapp/widgets/quina_wiget.dart';

import 'lotomania_widget.dart';

class BotaoMenu extends StatelessWidget {
  final String logo;
  final String jogo;
  final String passar;

  BotaoMenu(
      {Key? key, required this.jogo, required this.logo, required this.passar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => passar == 'quina'
                    ? QuinaWidget()
                    : passar == 'lotofacil'
                        ? LotofacioWidget()
                        : passar == 'megasena'
                            ? MegaSenaWidget()
                            : LotomaniaWidget()),
          );
        },
        child: (Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(20.0)),
          elevation: 1,
          color: Colors.transparent,
          child: SizedBox(
            height: 50,
            width: 400,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Image.asset(logo),
                SizedBox(
                  width: 30,
                ),
                Text(
                  jogo,
                  style: GoogleFonts.rubik(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        )));
  }
}
