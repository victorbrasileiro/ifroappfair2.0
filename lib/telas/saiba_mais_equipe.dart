import 'package:flutter/material.dart';

class EquipeDesenvolvimento extends StatefulWidget {
  const EquipeDesenvolvimento({super.key});

  static const appTitle = 'IFROAppFair';

  @override
  State<EquipeDesenvolvimento> createState() => _TelaEquipe();

}

class _TelaEquipe extends State<EquipeDesenvolvimento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 26,
            fontWeight: FontWeight.w700),
        backgroundColor: const Color.fromARGB(255, 5, 118, 133),
        title: const Text(
          'IFROAppFair',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SEGUNDO CONTAINER
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    children: [
                  const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'EQUIPE DE DESENVOLVIMENTO',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontFamily: 'Arial',
                          ),
                        ),

                        // estilização do titulo
                        Text(
                          'EQUIPE DE DESENVOLVIMENTO',
                          style: TextStyle(
                            decoration: TextDecoration.overline,
                            decorationColor: const Color.fromARGB(255, 5, 118, 133),
                            decorationThickness: 6.0,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    ),
                  ),

            // CONTAINER INTEGRANTE MARCELLO
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0),
                    width: 350,
                    height: 330,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 5,
                        ),
                      ]
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 270,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset(
                              "assets/images/marcello.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 80,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                Text(
                                  'Marcello Brasileiro',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Programador',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // CONTAINER INTEGRANTE GUSTAVO
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0),
                    width: 350,
                    height: 330,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                          ),
                        ]
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 270,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset(
                              "assets/images/gustavo.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 80,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                Text(
                                  'Gustavo Dias',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Programador',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //CONTAINER INTEGRANTE VITORIA
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0),
                    width: 350,
                    height: 330,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                          ),
                        ]
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 270,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset(
                              "assets/images/vitoria.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 80,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                Text(
                                  'Vitória Cristine',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Programadora',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // CONTAINER INTEGRANTE LEVIR
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0),
                    width: 350,
                    height: 330,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                          ),
                        ]
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 270,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset(
                              "assets/images/levir.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            //color: Colors.white,
                          ),
                          width: 300,
                          height: 80,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                Text(
                                  'Levir Menezes',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Programador',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: 'Times New Roman',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]
              ),
    )
          ]
        ),
    ),
    );
  }

}