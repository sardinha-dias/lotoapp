import 'package:flutter/material.dart';
import 'package:lotoapp/widgets/main_menu_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(144, 188, 185, 185),
          // primarySwatch: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: const MainMenuWidget(),
    );
  }
}
