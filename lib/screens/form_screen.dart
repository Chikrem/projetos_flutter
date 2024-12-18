import 'package:flutter/material.dart';
import '../data/task_inherited.dart'; // Importa o modelo de dados com herança

// Lista fixa de níveis de dificuldade disponíveis
const List<String> list = <String>['1', '2', '3', '4', '5'];

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Controladores para os campos de texto
  TextEditingController nameController = TextEditingController(); // Nome da tarefa
  TextEditingController imageController = TextEditingController(); // URL da imagem da tarefa

  // Variável para armazenar a dificuldade selecionada
  String selectedDifficulty = list.first; // Inicializa com o primeiro valor da lista

  // Chave global para o formulário, utilizada na validação
  final _formKey = GlobalKey<FormState>();

  // Função de validação para os campos de texto
  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true; // Retorna verdadeiro se o campo estiver vazio
    }
    return false; // Caso contrário, retorna falso
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Associa a chave global ao formulário
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova Tarefa', // Título da tela
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue, // Cor de fundo da AppBar
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              // Configurações do layout principal
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(16), // Margem ao redor do formulário
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), // Bordas arredondadas
                border: Border.all(
                  width: 2,
                  color: Colors.blue, // Cor da borda
                ),
                color: Colors.black12, // Cor de fundo do formulário
              ),
              padding: const EdgeInsets.all(8), // Espaçamento interno
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Campo de texto para o nome da tarefa
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome da Tarefa'; // Mensagem de erro
                        }
                        return null; // Campo válido
                      },
                      controller: nameController, // Associa o controlador
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome', // Rótulo do campo
                        fillColor: Colors.white70,
                        filled: true, // Fundo branco no campo
                      ),
                    ),
                  ),

                  // Menu suspenso para selecionar a dificuldade
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: DropdownMenu<String>(
                      initialSelection: selectedDifficulty, // Seleção inicial
                      label: const Text('Dificuldade'), // Rótulo do menu
                      onSelected: (String? value) {
                        setState(() {
                          selectedDifficulty = value!; // Atualiza a dificuldade selecionada
                        });
                      },
                      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                        // Converte a lista de strings em entradas de menu
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
                        if (valueValidator(value)) {
                          return 'Insira o URL da Imagem'; // Mensagem de erro
                        }
                        return null; // Campo válido
                      },
                      keyboardType: TextInputType.url, // Tipo de teclado para URLs
                      controller: imageController, // Associa o controlador
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Imagem', // Rótulo do campo
                        fillColor: Colors.white70,
                        filled: true, // Fundo branco no campo
                      ),
                    ),
                  ),

                  // Campo para pré-visualizar a imagem
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), // Bordas arredondadas
                        color: Colors.white70, // Fundo branco
                      ),
                      width: 140, // Largura do container de imagem
                      height: 180, // Altura do container de imagem
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4), // Bordas arredondadas para a imagem
                        child: Image.network(
                          imageController.text, // URL da imagem
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            // Exibe imagem padrão caso a URL seja inválida
                            return Image.asset('assets/images/no-image.png');
                          },
                          fit: BoxFit.cover, // Ajusta a imagem ao container
                        ),
                      ),
                    ),
                  ),

                  // Botão para adicionar a tarefa
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Se o formulário for válido, cria a nova tarefa
                        TaskInherited.of(context).newTask(
                          nameController.text, // Nome da tarefa
                          imageController.text, // URL da imagem
                          int.parse(selectedDifficulty), // Dificuldade selecionada
                        );

                        // Exibe um Snackbar confirmando a criação
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Criando uma nova Tarefa'),
                          ),
                        );

                        // Volta para a tela anterior
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'), // Texto do botão
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
