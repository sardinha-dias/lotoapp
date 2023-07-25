import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'lotofacil_widget.dart';
import 'megasena_widget.dart';
import 'quina_widget.dart';
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
                  ? QuinaWidget()
                  : passar == 'lotofacil'
                      ? const LotofacilWidget()
                      : passar == 'megasena'
                          ? const MegaSenaWidget()
                          : const LotomaniaWidget()),
        );
      },
      child: (Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.circular(20.0)),
        elevation: 1,
        color: Colors.transparent,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(logo),
              Center(
                  child: Text(
                jogo,
                // style: GoogleFonts.roboto(
                //   textStyle: const TextStyle(
                //     letterSpacing: 10,
                //     fontSize: 25,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white),
              )),
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
