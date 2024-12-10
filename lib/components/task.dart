// Classe que define um Card personalizado para exibir informações de tarefas
import 'package:flutter/material.dart';
import 'package:projetos_flutter/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome; // Nome da tarefa
  final String foto; // URL da imagem
  final int dif; // Dificuldade da tarefa

  const Task(this.nome, this.foto, this.dif, {super.key});

  @override
  State<Task> createState() => _CardState();
}

class _CardState extends State<Task> {
  int nivel = 0; // Nível da tarefa
  int barra = 0; // Progresso na barra de nível

  final List<Color> gradienteVerdeAVermelho = [
    Color(0xFF00FF00), // Verde
    Color(0xFF4CFF00), // Verde limão
    Color(0xFF99FF00), // Verde claro
    Color(0xFFFFCC00), // Amarelo
    Color(0xFFFFAA00), // Amarelo alaranjado
    Color(0xFFFF8800), // Laranja claro
    Color(0xFFFF5500), // Laranja escuro
    Color(0xFFFF3300), // Vermelho claro
    Color(0xFFFF1100), // Vermelho forte
    Color(0xFFFF0000), // Vermelho
  ];


  Color corPorNivel(int nivel) {
    return gradienteVerdeAVermelho[(nivel - 1).clamp(0, gradienteVerdeAVermelho.length - 1)];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Espaçamento ao redor do Card
      child: SizedBox(
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: corPorNivel(nivel),
                    borderRadius:
                    BorderRadius.circular(5), // Define o raio da borda
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 160, // Altura total do Card
                  margin: const EdgeInsets.all(10), // Espaçamento interno
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
                                offset: const Offset(0, 3),
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
                                child: Image.asset(
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
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    widget.nome,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        overflow: TextOverflow.ellipsis), // Texto truncado se for muito longo
                                  ),
                                ),

                                Difficulty(difficulty: widget.dif,),                  // Widget Estrelas de dificuldade

                              ],
                            ),
                            // Botão para ganhar XP
                            Container(
                              width: 60,
                              height: 80,
                              margin: const EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (nivel < 10) {
                                        barra++;
                                        if (barra == widget.dif * 10) { // Atualização com base na dificuldade
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
                            child: SizedBox(
                                width: 200,
                                child: LinearProgressIndicator(
                                  color: Colors.white,
                                  value: barra / (widget.dif * 10),
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
                              const TextStyle(color: Colors.white, fontSize: 16),
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


