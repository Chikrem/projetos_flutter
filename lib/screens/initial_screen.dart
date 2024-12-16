import 'package:flutter/material.dart';
import 'package:projetos_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

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
        duration: const Duration(milliseconds: 1000), // Duração da animação
          child: ListView(
            children: const [
              Task(
                  'Aprender Flutter',
                  'assets/images/dash.png',
                  3),
              Task(
                  'Andar de Bike',
                  'assets/images/bike.webp',
                  2),
              Task(
                  'Meditar',
                  'assets/images/meditar.jpeg',
                  5),
              Task(
                  'Ler',
                  'assets/images/livro.jpg',
                  4),
              Task('Jogar',
                  'assets/images/jogar.jpg',
                  1
              ),
              SizedBox(height: 80,)
            ],
          )
      ),

      floatingActionButton: FloatingActionButton(
        // Botão flutuante para alternar a visibilidade do conteúdo
        onPressed: () {
          setState(() {
            opacidade = !opacidade; // Inverte o estado de opacidade
          });
        },
        child: const Icon(Icons.remove_red_eye), // Ícone do botão
      ),
    );
  }
}

