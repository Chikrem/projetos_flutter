// Início Aula-1
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(                              // A Stack organiza widgets em uma pilha, ou seja, widgets são desenhados uns sobre os outros.
      alignment: AlignmentDirectional.center,   // centraliza os widgets filhos no eixo horizontal e vertical.
        children: [                             // Propriedade de Stack. Uma lista de widgets que serão empilhados.
          Container(                            // É usado para criar áreas retangulares na tela, com propriedades de estilo, como cor, tamanho, margens, etc.
            color: Colors.grey,
            width: 200,
            height: 80,
          ),
          Container(
            color: Colors.white12,
            width: 100,
            height: 40,
          ),
        ],
      ),
    );
  }
}
