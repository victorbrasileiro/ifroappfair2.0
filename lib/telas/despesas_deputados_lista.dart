import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'deputados_lista.dart';
import 'dart:convert';

class DespesaDeputado {
  final int ano;
  final int mes;
  final String tipoDespesa;
  final int codDocumento;
  final String tipoDocumento;
  final int codTipoDocumento;
  final String dataDocumento;
  final String numDocumento;
  final double valorDocumento;
  final String urlDocumento;
  final String nomeFornecedor;
  final String cnpjCpfFornecedor;
  final double valorLiquido;
  final double valorGlosa;
  final String numRessarcimento;
  final int codLote;
  final int parcela;

  DespesaDeputado({required this.ano, required this.cnpjCpfFornecedor, required this.codDocumento, required this.codLote, required this.codTipoDocumento, required this.dataDocumento, required this.mes, required this.nomeFornecedor, required this.numDocumento, required this.numRessarcimento, required this.parcela, required this.tipoDespesa, required this.tipoDocumento, required this.urlDocumento, required this.valorDocumento, required this.valorGlosa, required this.valorLiquido});

  factory DespesaDeputado.fromJson(Map<String, dynamic> json) {
    return DespesaDeputado(
        ano:               json['ano'],
        cnpjCpfFornecedor: json['cnpjCpfFornecedor'],
        codDocumento:      json['codDocumento'],
        codLote:           json['codLote'],
        codTipoDocumento:  json['codTipoDocumento'],
        dataDocumento:     json['dataDocumento'],
        mes:               json['mes'],
        nomeFornecedor:    json['nomeFornecedor'],
        numDocumento:      json['numDocumento'],
        numRessarcimento:  json['numRessarcimento'],
        parcela:           json['parcela'],
        tipoDespesa:       json['tipoDespesa'],
        tipoDocumento:     json['tipoDocumento'],
        urlDocumento:      json['urlDocumento'],
        valorDocumento:    json['valorDocumento']?.toDouble() ?? 0.0,
        valorGlosa:        json['valorGlosa']?.toDouble() ?? 0.0,
        valorLiquido:      json['valorLiquido']?.toDouble() ?? 0.0
    );
  }

}

class DespesasDeputadosListPage extends StatefulWidget {
  final Deputado deputado;
  final String ano;
  final String mes;

  const DespesasDeputadosListPage({
    super.key,
    required this.deputado,
    required this.ano,
    required this.mes,
  });

  @override
  _DespesasDeputadosListPageState createState() => _DespesasDeputadosListPageState();
}

class _DespesasDeputadosListPageState extends State<DespesasDeputadosListPage> {
  List<DespesaDeputado> _despesas = [];

  @override
  void initState() {
    super.initState();
    fetchDespesas();
  }

  Future<void> fetchDespesas() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/deputados/${widget.deputado.id}/despesas?ordem=ASC&ordenarPor=ano')
      .replace(queryParameters: {
        'ano': widget.ano,
        'mes': widget.mes
      })
    );

    // final response = await http.get(url, headers: {
    //   'Content-Type': 'application/json',
    // });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      setState(() {
        _despesas = (jsonData['dados'] as List)
            .map((json) => DespesaDeputado.fromJson(json))
            .toList();
      });
    } else {
      throw Exception('Falha ao carregar despesas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 26,
              fontWeight: FontWeight.w700),
          backgroundColor: const Color.fromARGB(255, 2, 132, 199),
          title: const Text(
            'DESPESAS',
          ),
        ),
      body: _despesas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _despesas.length,
              itemBuilder: (context, index) {
                final despesa = _despesas[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0),
                  width: 350,
                  height: 370,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                  leading: const Icon(
                      Icons.description_sharp,
                      size: 40,
                  ),
                  title: Text('${despesa.tipoDespesa}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text('VALOR: R\$ ${despesa.valorLiquido}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                  ),
                  ),
                );
              },
      )
    );
  }
}