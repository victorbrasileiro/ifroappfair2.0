import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'deputados_lista.dart';
import 'dart:convert';

class DespesaDeputado {
  final int ano;
  final String cnpjCpfFornecedor;
  final int codDocumento;
  final int codLote;
  final int codTipoDocumento;
  final String dataDocumento;
  final int mes;
  final String nomeFornecedor;
  final String numDocumento;
  final String numRessarcimento;
  final int parcela;
  final String tipoDespesa;
  final String tipoDocumento;
  final String urlDocumento;
  final double valorDocumento;
  final double valorGlosa;
  final double valorLiquido;

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
        valorDocumento:    json['valorDocumento'],
        valorGlosa:        json['valorGlosa'],
        valorLiquido:      json['valorLiquido']
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
    final response = await http.get(Uri.parse('https://dadosabertos.camara.leg.br/api/v2/deputados/${widget.deputado.id}/despesas?ordem=ASC&ordenarPor=ano')
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
        title: const Center(child: Text('Resultado Despesas', style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: _despesas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _despesas.length,
              itemBuilder: (context, index) {
                final despesa = _despesas[index];
                return ListTile(
                  title: Text('Descrição: ${despesa.tipoDespesa}'),
                  subtitle: Text('Valor: ${despesa.valorLiquido}'),
                );
              },
      )
    );
  }
}