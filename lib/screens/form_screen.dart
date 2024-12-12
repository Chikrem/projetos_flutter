import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Nova Tarefa',
             style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                width: 2,
                color: Colors.blue),
            color: Colors.black12,
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nome',
                  fillColor: Colors.white70,
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.grey
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}