import 'package:flutter/material.dart';

// Tela de formulário para adicionar uma nova tarefa
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  // Controladores para os campos de texto
  TextEditingController nameController = TextEditingController(); // Controlador para o campo "Nome"
  TextEditingController difController = TextEditingController(); // Controlador para o campo "Dificuldade"
  TextEditingController imageController = TextEditingController(); // Controlador para o campo "Imagem"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nova Tarefa', // Título da tela
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
      ),
      body: Center(
        child: Container(
          // Container centralizado que envolve o formulário
          width: MediaQuery.of(context).size.width, // Largura responsiva
          height: MediaQuery.of(context).size.height, // Altura responsiva
          margin: const EdgeInsets.all(16), // Margem externa ao redor do container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), // Bordas arredondadas
            border: Border.all(
              width: 2,
              color: Colors.blue, // Cor da borda do container
            ),
            color: Colors.black12, // Cor de fundo do container
          ),
          padding: const EdgeInsets.all(8), // Padding interno do container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Campo de texto para o nome
              Padding(
                padding: const EdgeInsets.all(8.0), // Espaçamento ao redor do campo
                child: TextFormField(
                  controller: nameController, // Controlador associado ao campo
                  textAlign: TextAlign.center, // Texto centralizado
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0), // Cor da borda padrão
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 1.5), // Cor da borda quando inativo
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.5), // Cor da borda ao focar
                    ),
                    labelText: 'Nome', // Texto do rótulo
                    fillColor: Colors.white70, // Cor de fundo do campo
                    filled: true, // Preenchimento habilitado
                    labelStyle: TextStyle(
                      color: Colors.black45, // Cor do texto do rótulo
                    ),
                  ),
                ),
              ),

              // Campo de texto para a dificuldade
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: difController, // Controlador associado ao campo
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.5),
                    ),
                    labelText: 'Dificuldade',
                    fillColor: Colors.white70,
                    filled: true,
                    labelStyle: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),

              // Campo de texto para o link da imagem
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (texto){
                    setState(() {
                      // Atualiza a versão da imagem sempre que o campo de url da imagem é alterado
                    });
                  },
                  controller: imageController, // Controlador associado ao campo
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.5),
                    ),
                    labelText: 'Imagem', // Texto do rótulo
                    fillColor: Colors.white70,
                    filled: true,
                    labelStyle: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),

              // Campo de previsualização da imagem
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white70,
                ),
                width: 100,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    imageController.text, // Imagem carregada da URL
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return Image.asset('assets/images/no-image.png');
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Botão para adicionar a tarefa
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão
                  print(nameController.text); // Exibe o nome no console
                  
                  ((int.parse(difController.text) <= 0 || int.parse(difController.text) >= 5) ? (print("Selecione a Dificuldade de 1 a 5")) : (print(int.parse(difController.text)))); // Exibe a dificuldade como inteiro

                  print(imageController.text); // Exibe o link da imagem no console
                },
                child: const Text('Adicionar'), // Texto do botão
              ),
            ],
          ),
        ),
      ),
    );
  }
}
