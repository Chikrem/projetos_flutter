import 'package:flutter/material.dart';
import 'package:projetos_flutter/components/task.dart';
import 'package:projetos_flutter/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

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
      body: ListView(
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
      ),

      floatingActionButton: FloatingActionButton(
        // Botão flutuante para alternar a visibilidade do conteúdo
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FormScreen(), ),);
        },
        child: const Icon(Icons.add), // Ícone do botão
      ),
    );
  }
}

