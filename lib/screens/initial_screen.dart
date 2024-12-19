import 'package:flutter/material.dart';
import 'package:projetos_flutter/components/task.dart';
import 'package:projetos_flutter/data/task_dao.dart';
import 'package:projetos_flutter/data/task_inherited.dart';
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
        bottom: const PreferredSize(preferredSize: (Size.square(20)),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
            )),
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),// lista de Tarefas
        child: FutureBuilder<List<Task>>(future: TaskDao().findAll(), builder: (context, snapshot){
          List<Task>? items = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
            case ConnectionState.waiting:
              // TODO: Handle this case.
            case ConnectionState.active:
              // TODO: Handle this case.
            case ConnectionState.done:
              if (snapshot.hasData && items != null){
                if(items.isNotEmpty){
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index){
                        final Task tarefa = items[index];
                        return tarefa;
                      });
                }
              }
            break;
          }
        }),
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

