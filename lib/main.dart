// Início Aula-5

import 'package:flutter/material.dart';
import 'package:projetos_flutter/screens/form_screen.dart';
import 'package:projetos_flutter/screens/initial_screen.dart';


// O ponto de entrada do aplicativo
void main() {
  runApp(const MyApp());
}

// Widget principal do aplicativo, que é um StatefulWidget para permitir mudanças de estado
class MyApp extends StatelessWidget {

  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define o tema principal do aplicativo
          primarySwatch: (Colors.deepPurple),
        ),
        home: const FormScreen());  // Scafold Widget
  }
}
