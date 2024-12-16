import 'package:flutter/material.dart';
import '../data/task_inherited.dart';

const List<String> list = <String>['1', '2', '3', '4', '5'];

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Controladores para os campos de texto
  TextEditingController nameController = TextEditingController(); // Nome
  TextEditingController imageController = TextEditingController(); // Imagem

  // Variável para armazenar a dificuldade selecionada
  String selectedDifficulty = list.first; // Valor padrão inicial

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova Tarefa',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
                color: Colors.black12,
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Campo de texto para o nome
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
      
                  // DropdownMenu para selecionar a dificuldade
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: DropdownMenu<String>(
                      initialSelection: selectedDifficulty,
                      label: const Text('Dificuldade'),
                      onSelected: (String? value) {
                        setState(() {
                          selectedDifficulty = value!;
                        });
                      },
                      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {    // converter a lista de strings em entradas
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                        );
                      }).toList(),
                    ),
                  ),
      
                  // Campo de texto para o link da imagem
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o URL da Imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
      
                  // Campo de pré-visualização da imagem
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Container(
      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white70,
                      ),
                      width: 140,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Image.asset('assets/images/no-image.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
      
                  // Botão para adicionar a tarefa
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        TaskInherited.of(context).newTask(nameController.text, imageController.text, int.parse(selectedDifficulty));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Criando uma nova Tarefa'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
