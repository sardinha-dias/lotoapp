import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/main_menu_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lotoapp/widgets/numeros_aleatorios.dart';
//import 'package:lotoapp/widgets/quina_widget.dart';
import 'package:provider/provider.dart';
//import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('JogosSalvos');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(144, 188, 185, 185),
            // primarySwatch: Colors.amber,
          ),
          scaffoldBackgroundColor: Colors.grey.shade200,
        ),
        home: const MainMenuWidget());
  }
}
