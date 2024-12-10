

import 'package:flutter/material.dart';
import 'package:projetos_flutter/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Task(
                  'Estudar Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
            ),
            Task(
                'Andar de Bike',
                'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                2),
            Task(
                'Ler 50 páginas',
                'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                1),
            Task(
                'Meditar',
                'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                4),
            Task('Jogar',
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
    );
  }
}

