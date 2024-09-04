import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetoflutter/telas/deputados_lista_delegate.dart';
import 'despesas_deputados_lista.dart';

class Deputado {
  final int id;
  final int idLegislatura;
  final String email;
  final String nome;
  final String siglaPartido;
  final String siglaUf;
  final String uri;
  final String uriPartido;
  final String urlFoto;

  Deputado({required this.email, required this.id, required this.idLegislatura, required this.nome, required this.siglaPartido, required this.siglaUf, required this.uri, required this.uriPartido, required this.urlFoto});

  factory Deputado.fromJson(Map<String, dynamic> json) {
    return Deputado(
        id: json['id'],
        idLegislatura: json['idLegislatura'],
        email: json['email'],
        nome: json['nome'],
        siglaPartido: json['siglaPartido'],
        siglaUf: json['siglaUf'],
        uri: json['uri'],
        uriPartido: json['uriPartido'],
        urlFoto: json['urlFoto']
    );
  }

}

class DeputadoListPage extends StatefulWidget {
  final String nome;
  final String partido;
  final String ano;
  final String mes;
  final bool lista;

  const DeputadoListPage({super.key, required this.nome, required this.partido, required this.ano, required this.mes, required this.lista});

  @override
  _DeputadoListPageState createState() => _DeputadoListPageState();
}

class _DeputadoListPageState extends State<DeputadoListPage> {
  List<Deputado> _deputados = [];

  @override
  void initState() {
    super.initState();
    _fetchDeputados();
  }

  Future<void> _fetchDeputados() async {
    // if (widget.lista){
    //   //final response = await http.get(Uri.parse('http://10.0.2.2:3000/deputados'));
    //   final response = await http.get(Uri.parse('http://10.0.2.2:3000/deputados'));
    // }else{
    //   final response = await http.get(Uri.parse('http://10.0.2.2:3000/deputados/deputado')
    //     .replace(queryParameters: {
    //       'nome': widget.nome,
    //       'partido': widget.partido
    //     })
    //   );
    // }

    final response = await http.get(Uri.parse('http://10.0.2.2:3000/deputados'));

    if  (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      setState(() {
        _deputados = (jsonData['deputados'] as List)
            .map((json) => Deputado.fromJson(json))
            .toList();
      });
    } else {
      throw Exception('Falha ao obter a lista de deputados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 26,
              fontWeight: FontWeight.w700),
          backgroundColor: const Color.fromARGB(255, 5, 118, 133),
          title: const Text(
            'DEPUTADOS',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DeputadoSearchDelegate(_deputados),
                );
              },
            ),
          ],
        ),
        body: _deputados.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: _deputados.length,
            itemBuilder: (context, index) {
              final deputado = _deputados[index];
              final dataAtual = DateTime.now();
              String ano = dataAtual.year.toString();
              String mes = dataAtual.month.toString();
              if (dataAtual.month == 1) {
                mes = '12';
                ano = (dataAtual.year - 1).toString();
              }

              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  // imagem do deputado
                  leading: Image.network(
                    deputado.urlFoto,
                    width: 50, // Largura da imagem
                    height: 60, // Altura da imagem
                    fit: BoxFit.cover,
                  ),

                  // nome do deputado
                  title: Text(
                    deputado.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),

                  // partido do deputado
                  subtitle: Text(
                    deputado.siglaPartido,
                    style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DespesasDeputadosListPage(
                              deputado: deputado,
                              mes: mes,
                              ano: ano
                            )),
                  );
                },
                ),
              );
            }
        )
    );
  }
}
