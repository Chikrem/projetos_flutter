import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: (Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de Column')),
        body:

        Stack(
          children: [                                               // Um layout que permite sobrepor widgets uns sobre os outros.
            Container(                                              // Um widget flexível que combina layout e estilo. Pode ser usado para definir dimensões, bordas, cores, padding, margens e muito mais.
              color: Colors.black,
            ),
            Column(                                                 // Organiza seus filhos (widgets) em uma disposição vertical (de cima para baixo), proporcionando uma maneira simples e eficaz de construir layouts verticais.

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,     // Distribui os containers com espaçamento igual entre eles.
              crossAxisAlignment: CrossAxisAlignment.center,        // Centraliza os containers horizontalmente.

              children: [                                           // Assim como o Stack, possui a propriedade Children que permite agrupar vários Widgets.
                                                                    // O primeiro Filho é uma Fileira de Containers e os outros 3 são Containers separados.

                Row(                                                // O Row é um widget do Flutter usado para organizar widgets filhos em uma disposição horizontal (lado a lado). Ele é o equivalente horizontal do Column e é muito útil para criar layouts onde os elementos precisam ser exibidos lado a lado.
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribui os containers com espaçamento igual entre eles.
                  crossAxisAlignment: CrossAxisAlignment.center,    // Centraliza os containers verticalmente.

                  children: [                                        // Assim como o Stack, possui a propriedade Children que permite agrupar vários Widgets.
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(color: Colors.red, width: 100, height: 100,),
                        Container(color: Colors.blue, width: 50, height: 50,
                          child: const Center(child: Text('Box 1')),),
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(color: Colors.red, width: 100, height: 100,),
                        Container(color: Colors.blue, width: 50, height: 50,
                          child: const Center(child: Text('Box 2')),),
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(color: Colors.red, width: 100, height: 100,),
                        Container(color: Colors.blue, width: 50, height: 50,
                          child: const Center(child: Text('Box 3')),),
                      ],
                    ),
                  ],
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(child: Text('Box 1')),
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: const Center(child: Text('Box 2')),
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(child: Text('Box 3')),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
