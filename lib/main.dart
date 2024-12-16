// Início Aula-5

import 'package:flutter/material.dart';
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
    return const MaterialApp(
        home: InitialScreen());  // Scafold Widget
  }
}
