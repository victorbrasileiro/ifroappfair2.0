import 'package:flutter/material.dart';
import 'package:projetoflutter/telas/deputados_lista.dart';
import 'package:projetoflutter/telas/busca_deputados_form.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  static const appTitle = 'IFROAppFair';

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
        backgroundColor: const Color.fromARGB(255, 2, 132, 199),
        title: const Text(
          'IFROAppFair',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botões
                  ElevatedButton(
                      onPressed: () {
                        // Navigate to second route when tapped.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              DeputadoListPage(
                                nome: '',
                                partido: '',
                                ano: '',
                                mes: '',
                                lista: true
                              )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 16.0), // Aumenta o tamanho do botão
                        shape: const RoundedRectangleBorder(
                          // Muda a forma das bordas
                          side: BorderSide(
                              color: Color.fromARGB(255, 2, 132, 199),
                              width: 1.0), // Muda a cor e largura das bordas
                        ),
                        backgroundColor: const Color.fromARGB(255, 2, 132, 199),
                      ),
                      child: const Text(
                        'Parlamentares',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BuscaDeputadosFormPage()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 16.0), // Aumenta o tamanho do botão
                      shape: const RoundedRectangleBorder(
                        // Muda a forma das bordas
                        side: BorderSide(
                            color: Color.fromARGB(255, 2, 132, 199),
                            width: 1.0), // Muda a cor e largura das bordas
                      ),
                      backgroundColor: const Color.fromARGB(255, 2, 132, 199),
                    ),
                    child: const Text(
                      'Buscar Parlamentar',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              // PRIMEIRO CONTAINER DE BEM-VINDOS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 350,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 2, 132, 199),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      width: 300,
                      height: 175,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Bem-Vindo ao portal da transparência dos deputados de Rondônia. Aqui você vai encontrar os dados fornecidos pela câmara no ano de 2024. ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // SEGUNDO CONTAINER
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 350,
                      height: 430,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 2, 132, 199),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 21.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Image.asset(
                                "assets/images/depesas.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 100,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Fique atento aos gastos para exercício da atividade parlamentar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 35.0, bottom: 10.0),
                child: Column(
                  children: [
                    Text(
                      'EQUIPE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // CONTAINER INTEGRANTE MARCELLO
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0),
                      width: 350,
                      height: 370,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 270,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
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
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 80,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Marcello Brasileiro',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Programador',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
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
                padding: const EdgeInsets.all(7.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0),
                      width: 350,
                      height: 370,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 270,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
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
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 80,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Gustavo Dias',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Programador',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
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
                padding: const EdgeInsets.all(7.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0),
                      width: 350,
                      height: 370,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 270,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
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
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 80,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Vitória Cristine',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Programadora',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
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
                padding: const EdgeInsets.all(7.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0),
                      width: 350,
                      height: 370,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 270,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
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
                              color: Colors.white,
                            ),
                            width: 300,
                            height: 80,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Levir Menezes',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Programador',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
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
        ),
    );
  }
}