import 'package:flutter/material.dart';
import 'package:projetos_flutter/initialScreen.dart';


// O ponto de entrada do aplicativo
void main() {
  runApp(MyApp());
}

// Widget principal do aplicativo, que é um StatefulWidget para permitir mudanças de estado
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Controla a opacidade do conteúdo no corpo do Scaffold
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define o tema principal do aplicativo
          primarySwatch: (Colors.deepPurple),
        ),
        home: const InitialScreen());
  }
}
