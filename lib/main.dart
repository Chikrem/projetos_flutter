import 'package:flutter/material.dart';

import 'difficulty.dart';

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
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Tarefas', // Título exibido na barra superior
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue, // Cor de fundo da AppBar
          ),
          body: AnimatedOpacity(
            // Anima a transição de opacidade ao alternar entre os estados
            opacity: opacidade ? 1 : 0, // Define se o conteúdo é visível ou não
            duration: Duration(milliseconds: 1000), // Duração da animação
            child: ListView(
              children: [
                // Lista de Cards exibindo as tarefas
                Padding(
                  padding: EdgeInsets.only(top: 8),
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
                  height: 100, // Espaço vazio ao final da lista
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // Botão flutuante para alternar a visibilidade do conteúdo
            onPressed: () {
              setState(() {
                opacidade = !opacidade; // Inverte o estado de opacidade
              });
            },
            child: Icon(Icons.remove_red_eye), // Ícone do botão
          ),
        ));
  }
}

// Classe que define um Card personalizado para exibir informações de tarefas
class Card extends StatefulWidget {
  final String nome; // Nome da tarefa
  final String foto; // URL da imagem
  final int dif; // Dificuldade da tarefa

  Card(this.nome, this.foto, this.dif, {super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  int nivel = 0; // Nível da tarefa
  int barra = 0; // Progresso na barra de nível

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Espaçamento ao redor do Card
      child: Container(
        width: MediaQuery.of(context).size.width, // Largura responsiva
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Sombra do Card
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
                  height: 160, // Altura total do Card
                  margin: EdgeInsets.all(10), // Espaçamento interno
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Sombra interna
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5), // Bordas arredondadas
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 120, // Altura da parte superior do Card
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Imagem da tarefa
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
                                  widget.foto, // Imagem carregada da URL
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Nome da tarefa
                                Container(
                                  width: 170,
                                  child: Text(
                                    widget.nome,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        overflow: TextOverflow.ellipsis), // Texto truncado se for muito longo
                                  ),
                                ),
                                Container(
                                  child: Difficulty(difficulty: widget.dif,),                  // Widget Estrelas de dificuldade

                                ),
                              ],
                            ),
                            // Botão para ganhar XP
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
                                          nivel++; // Incrementa o nível ao completar a barra
                                          barra = 0;
                                        }
                                      }
                                    });
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
                          // Barra de progresso do nível
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
                          // Exibição do nível atual
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


