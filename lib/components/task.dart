// Classe que define um Card personalizado para exibir informações de tarefas
import 'package:flutter/material.dart';
import 'package:projetos_flutter/components/difficulty.dart'; // Importa o widget Difficulty

class Task extends StatefulWidget {
  final String nome; // Nome da tarefa
  final String foto; // URL ou caminho da imagem da tarefa
  final int dif; // Nível de dificuldade da tarefa

  // Construtor da classe que recebe nome, foto e dificuldade da tarefa
  Task(this.nome, this.foto, this.dif, {super.key});

  int nivel = 0; // Nível atual da tarefa, inicializado como 0
  int barra = 0; // Progresso da barra de nível, inicializado como 0

  @override
  State<Task> createState() => _CardState();
}

class _CardState extends State<Task> {

  // Função para verificar se a imagem é um asset local ou uma imagem da internet
  bool assetOrNetwork(){
    if(widget.foto.contains('http')){
      return false; // Se contiver 'http', é uma imagem de rede (URL)
    }
    return true; // Caso contrário, é um asset local
  }

  // Lista de cores para o gradiente de níveis
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

  // Função para determinar a cor de acordo com o nível
  Color corPorNivel(int nivel) {
    // O nível é ajustado para garantir que não ultrapasse os limites da lista de cores
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
                // Container principal do Card
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Sombra do Card
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Deslocamento da sombra
                      ),
                    ],
                    color: corPorNivel(widget.nivel), // Cor baseada no nível
                    borderRadius:
                    BorderRadius.circular(5), // Bordas arredondadas
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 160, // Altura total do Card
                  margin: const EdgeInsets.all(10), // Espaçamento interno
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // Container para a parte superior do Card
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // Sombra interna
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3), // Deslocamento da sombra
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
                                  color: Colors.blueGrey, // Cor de fundo
                                ),
                                width: 100,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: assetOrNetwork() ? Image.asset(
                                    widget.foto, // Carrega a imagem local
                                    fit: BoxFit.cover, // Ajusta a imagem
                                  ) : Image.network(
                                    widget.foto, // Carrega a imagem da URL
                                    fit: BoxFit.cover, // Ajusta a imagem
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
                                          overflow: TextOverflow.ellipsis), // Texto truncado
                                    ),
                                  ),

                                  Difficulty(difficulty: widget.dif,), // Widget de estrelas de dificuldade
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
                                        if (widget.nivel < 10) {
                                          widget.barra++; // Incrementa o progresso da barra
                                          if (widget.barra == widget.dif * 10) { // Checa se a barra está cheia
                                            widget.nivel++; // Incrementa o nível ao completar a barra
                                            widget.barra = 0; // Reseta a barra
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Barra de progresso do nível
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: 250,
                                child: LinearProgressIndicator(
                                  color: Colors.white,
                                  value: widget.barra / (widget.dif * 10), // Calcula o progresso da barra
                                )),
                          ),
                          // Exibição do nível atual
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              (widget.nivel == 10)
                                  ? ('Nível: Max') // Exibe "Max" quando o nível atinge o máximo
                                  : ('Nível:${widget.nivel}'), // Exibe o nível atual
                              style: const TextStyle(color: Colors.white, fontSize: 16),
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
