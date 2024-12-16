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
          // Lista de Tarefas
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

