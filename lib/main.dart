import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

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
          body: AnimatedOpacity(
            opacity: opacidade ? 1 : 0,
            duration: Duration(milliseconds: 1000),
            child: ListView(
              children:[
                Padding(
                  padding: EdgeInsets.only(top:8),
                  child: Card(
                      'Estudar Flutter',
                      'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                      3),
                ),
                Card(
                    'Andar de Bike',
                    'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                    2),
                Card(
                    'Ler 50 páginas',
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                    1),
                Card(
                    'Meditar',
                    'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                    4),
                Card('Jogar',
                    'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
                     1),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState((){
                opacidade = !opacidade;
              });
            },
            child: Icon(Icons.remove_red_eye),
          ),
        ));
  }
}

class Card extends StatefulWidget {
  final String nome;
  final String foto;
  final int dif;

  Card(this.nome, this.foto, this.dif, {super.key});

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
                            borderRadius: BorderRadius.circular(
                                5), // Define o raio da borda
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
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.blueGrey,
                              ),
                              width: 100,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170,
                                  child: Text(
                                    widget.nome,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 15,
                                          color: widget.dif >= 1
                                              ? Colors.blue
                                              : Colors.blue[100]),
                                      Icon(Icons.star,
                                          size: 15,
                                          color: widget.dif >= 2
                                              ? Colors.blue
                                              : Colors.blue[100]),
                                      Icon(Icons.star,
                                          size: 15,
                                          color: widget.dif >= 3
                                              ? Colors.blue
                                              : Colors.blue[100]),
                                      Icon(Icons.star,
                                          size: 15,
                                          color: widget.dif >= 4
                                              ? Colors.blue
                                              : Colors.blue[100]),
                                      Icon(Icons.star,
                                          size: 15,
                                          color: widget.dif >= 5
                                              ? Colors.blue
                                              : Colors.blue[100]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 60,
                              height: 80,
                              margin: EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (nivel < 10) {
                                        barra++;
                                        if (barra == 10) {
                                          nivel++;
                                          barra = 0;
                                        }
                                      }
                                    });
                                    // print(nivel);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  value: (widget.dif > 0)
                                      ? (barra / widget.dif) / 10
                                      : 1,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              (nivel == 10)
                                  ? ('Nível: Max')
                                  : ('Nível: $nivel'),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
