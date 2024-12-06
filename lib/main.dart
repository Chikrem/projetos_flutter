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

        Stack(                                                      // Precione Alt + Enter para envolver o Widget com outro.
          children: [                                               // Um layout que permite sobrepor widgets uns sobre os outros.
            Container(                                              // Um widget flexível que combina layout e estilo. Pode ser usado para definir dimensões, bordas, cores, padding, margens e muito mais.
              color: Colors.cyan,
            ),
            SingleChildScrollView(                                  // Permite que o conteúdo seja rolado se exceder os limites do contêiner.

              child: Column(                                                 // Organiza seus filhos (widgets) em uma disposição vertical (de cima para baixo), proporcionando uma maneira simples e eficaz de construir layouts verticais.
              
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
                    height: 300,
                    color: Colors.red,
                    margin: EdgeInsets.all(10),
                    child: const Center(child: Text(
                      'Este é um texto muito longo que pode causar overflow.',          // "overflow" ocorre quando um widget tenta renderizar conteúdo que excede os limites do seu contêiner pai.
                      overflow: TextOverflow.ellipsis,
                    )),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    margin: EdgeInsets.all(10),
                    child: const Center(child: Text('Box 2')),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    child: const Center(child: Text('Box 3')),
                  ),
                  Container(
                    height: 50,
                    width: 450,
                    margin: const EdgeInsets.all(16),                 // Ajuste de Margem. Adiciona 16 de margem em todos os lados.
                    padding: const EdgeInsets.only(top: 10),          // Ajuste espaço interno entre o conteúdo e as bordas do widget.
                    decoration: BoxDecoration(                        // O DecoratedBox é uma ferramenta poderosa para estilização no Flutter e, em conjunto com outros widgets, ajuda a construir interfaces elegantes e responsivas.
                      color: Colors.yellow,
                      border: Border.all(color: Colors.black, width: 2),  // Define uma borda preta
                      borderRadius: BorderRadius.circular(10),            // Adiciona cantos arredondados
                    ),
                    child: const Text(                                    // Text é responsável por exibir texto na interface do usuário.
                        'Container Amarelo com Box Decoration ',          // String Data
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){print("Botão Pressionado");},      // Gatilho de Botão
                      child: Text("Elevated Button")),
                  ElevatedButton(
                    onPressed: () {
                      print('Botão estilizado pressionado!');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10, // Elevação
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),      // Bordas arredondadas
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),                                              // Espaçamento interno
              
                    ),
                    child: const Text(
                      'Elevated Button Estilizado',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
