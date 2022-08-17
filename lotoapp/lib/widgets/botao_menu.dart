import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lotofacio_widgegt.dart';
import 'magasena_widget.dart';
import 'quina_wiget.dart';

import 'lotomania_widget.dart';

class BotaoMenu extends StatelessWidget {
  final String logo;
  final String jogo;
  final String passar;

  const BotaoMenu(
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
                    ? const QuinaWidget()
                    : passar == 'lotofacil'
                        ? const LotofacioWidget()
                        : passar == 'megasena'
                            ? const MegaSenaWidget()
                            : const LotomaniaWidget()),
          );
        },
        child: (Card(
          shape: RoundedRectangleBorder(
              side: const BorderSide(
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
                const SizedBox(
                  width: 30,
                ),
                Image.asset(logo),
                const SizedBox(
                  width: 30,
                ),
                Center(
                  child: Text(
                    jogo,
                    style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
