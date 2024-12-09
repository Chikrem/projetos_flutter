import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: (Colors.deepPurple),
      ),
      home: Scaffold(
          appBar: AppBar(
              title: const Text('Tarefas',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              backgroundColor: Colors.blue,
          ),

          body: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(
                                    5), // Define o raio da borda
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              margin: EdgeInsets.all(10),
                            ),
                            Stack(children: [
                              Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        5), // Define o raio da borda
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 120,
                                  margin: EdgeInsets.symmetric(horizontal: 10)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,

                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(
                                          5), // Define o raio da borda
                                    ),
                                    width: 100,
                                    height: 120,
                                    margin: EdgeInsets.only(left: 10),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('Aprender Flutter'),
                                      ),
                                      Container(
                                        child: Text('estrelas'),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 60,
                                    height: 80,
                                    margin: EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          print(
                                              'Botão estilizado pressionado!');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 0,
                                            vertical: 0,
                                          ),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_up,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Lvl Up',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),

                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
