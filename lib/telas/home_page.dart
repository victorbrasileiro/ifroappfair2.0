import 'package:flutter/material.dart';
import 'package:projetoflutter/telas/deputados_lista.dart';
import 'package:projetoflutter/telas/saiba_mais_equipe.dart';

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
        backgroundColor: const Color.fromARGB(255, 5, 118, 133),
        title: const Text(
          'IFROAppFair',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              // primeiro container de Seja Bem Vindo(a)!
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      // width: 400,
                      // height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color.fromARGB(255, 2, 132, 199),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      // width: 360,
                      // height: 330,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Seja Bem-Vindo(a)! ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 29,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // segundo container do texto para clicar no botao dos parlamentares
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                                'Clique no botão abaixo para conferir as despesas de cada parlamentar no ano de 2024.',
                                 //   'No botão abaixo está disponível todos os parlamentares em atividade no ano de 2024. \n\n',
                                // 'O portal da transparência dos deputados de Rondônia. \n\n'
                                // 'Aqui você vai encontrar os dados fornecidos pela câmara no ano de 2024. \n\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
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

              // botao parlamentares
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
                                const DeputadoListPage(
                                    nome: '',
                                    partido: '',
                                    ano: '',
                                    mes: '',
                                    lista: true
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blueGrey,
                      elevation: 15,
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 40.0), // Aumenta o tamanho do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        // Muda a forma das bordas
                        side: const BorderSide(
                            width: 1.0), // Muda a cor e largura das bordas
                      ),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                      'PARLAMENTARES 2024',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),

              // terceiro container
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0, bottom: 0.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 400,
                      height: 1090,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 5, 118, 133),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 350,
                            height: 210,
                            child: const Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Text(
                                'O IFROAppFair é um portal de transparência dos deputados em atividade no Brasil. \n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 27,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        // container da primeira imagem
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 350,
                            height: 270,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset(
                                "assets/images/despesas.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // containers texto abaixo da primeira imagem
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 350,
                            height: 150,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Aqui estão disponíveis todas as despesas registradas dos deputados dos últimos 6 meses.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        // container da segunda imagem
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 350,
                            height: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset(
                                "assets/images/despesasPolitico.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // containers texto abaixo da segunda imagem
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            width: 350,
                            height: 120,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Se atente aos gastos para exercício da atividade parlamentar.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
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

              // container equipe
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  width: 350,
                  height: 120,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 40.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      'Clique no botão abaixo para saber quem somos.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // botao equipe saiba mais
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EquipeDesenvolvimento()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blueGrey,
                      elevation: 15,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 30.0), // Aumenta o tamanho do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        // Muda a forma das bordas
                        side: const BorderSide(
                            width: 0.0), // Muda a cor e largura das bordas
                      ),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                      'Saiba Mais',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              // container em branco para dar o espaçamento necessário
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  width: 350,
                  height: 20,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}