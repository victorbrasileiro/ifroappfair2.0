import 'package:flutter/material.dart';
import 'deputados_lista.dart';
import 'despesas_deputados_lista.dart';

class DeputadoSearchDelegate extends SearchDelegate {
  final List<Deputado> deputados;

  DeputadoSearchDelegate(this.deputados);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Fecha a pesquisa
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Deputado> matchQuery = deputados.where((deputado) {
      final nomeLower = deputado.nome.toLowerCase();
      final partidoLower = deputado.siglaPartido.toLowerCase();
      final searchLower = query.toLowerCase();
      return nomeLower.contains(searchLower) || partidoLower.contains(searchLower);
    }).toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        Deputado deputado = matchQuery[index];
        final dataAtual = DateTime.now();
        String ano = dataAtual.year.toString();
        String mes = dataAtual.month.toString();

        if (dataAtual.month == 1) {
          mes = '12';
          ano = (dataAtual.year - 1).toString();
        }

        return ListTile(
          leading: Image.network(
            deputado.urlFoto,
            width: 40,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            deputado.nome,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
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
                builder: (context) => DespesasDeputadosListPage(
                  deputado: deputado,
                  mes: mes,
                  ano: ano,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }


}