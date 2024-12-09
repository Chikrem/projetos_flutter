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
          appBar: AppBar(
            title: const Text(
              'Tarefas',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: ListView(
                    children: [
                      Card('Flutter 0', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
                      Card('Flutter 0', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
                      Card('Flutter 0', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
                      Card('Flutter 0', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
                      Card('Flutter 0', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
                      Card('Flutter 0', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
                    ],
              )
      )
    );
  }
}

class Card extends StatefulWidget {
  final String nome;
  final String foto;

  Card (this.nome, this.foto, {super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {

  int nivel = 0;
  int barra = 0;

  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.circular(5), // Define o raio da borda
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  margin: EdgeInsets.all(10),

                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(5), // Define o raio da borda
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius:
                                BorderRadius.circular(5), // Define o raio da borda
                              ),
                              width: 100,
                              height: 120,
                              child: Image.network(
                                   widget.foto,
                                   fit: BoxFit.cover),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    widget.nome,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ),
                                const Text('estrelas'),
                              ],
                            ),

                            Container(
                              width: 60,
                              height: 80,
                              margin: EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      barra++;
                                      if (barra == 10){
                                        nivel++;
                                        barra = 0;
                                      };
                                    });
                                    print(nivel);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '+ XP',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ]),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 200,
                                child: LinearProgressIndicator(
                                  color: Colors.white,
                                  value: barra/10,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Nível: $nivel',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

