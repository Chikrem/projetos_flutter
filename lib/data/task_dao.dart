import 'package:projetos_flutter/components/task.dart';
import 'package:projetos_flutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {

  static const String tableSQL = 'CREATE TABLE $_tablename('

      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {}

  delete(String nomeDaTarefa) async {}

  List<Task> toList(List<Map<String,dynamic>> mapaDeTarefas){

    print('Convertendo to List');

    final List<Task> tarefas = [];

    for (Map<String,dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    };

    print('Lista de Tarefas: $tarefas');

    return tarefas;
  }

  // query is for reading a table content. It returns a list of map.
  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename,
        where: '$_name = ?',
        whereArgs: [nomeDaTarefa]
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }
  

}