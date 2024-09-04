import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'deputados_lista.dart';

class BuscaDeputadosFormPage extends StatelessWidget {
  const BuscaDeputadosFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 28),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: const Color.fromARGB(255, 5, 118, 133),
        title: const Text(
          'IFROAppFair',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(14.0),
        child: BuscaDeputadosForm(),
      ),
    );
  }
}

class BuscaDeputadosForm extends StatefulWidget {
  const BuscaDeputadosForm({super.key});

  @override
  _BuscaDeputadosFormState createState() =>
      _BuscaDeputadosFormState();
}

class _BuscaDeputadosFormState extends State<BuscaDeputadosForm> {
  final _formKey = GlobalKey<FormState>();

  String _nome    = 'Eduardo Paes';
  String _partido = 'PT';
  String _ano     = '2024';
  String _mes     = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Busca Parlamentar',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Campo parlamentar
                TextFormField(
                  initialValue: _nome,
                  decoration: const InputDecoration(labelText: 'Nome do Parlamentar'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira o nome de um parlamentar';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _nome = value;
                    });
                  },
                ),
                // Campo partido
                TextFormField(
                  initialValue: _partido,
                  decoration: const InputDecoration(labelText: 'Partido'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira o nome de um partido';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _partido = value;
                    });
                  },
                ),
                // Campo ano e mês
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        initialValue: _ano,
                        enabled: false,
                        // Disable editing for the year field
                        decoration: const InputDecoration(labelText: 'Ano'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira um ano por favor';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _ano = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        initialValue: _mes,
                        decoration: const InputDecoration(labelText: 'Mês'),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira um mês';
                          }
                          int? month = int.tryParse(value);
                          if (month == null || month < 1 || month > 12) {
                            return 'Mês inválido';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _mes = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DeputadoListPage(
                                      nome:    _nome,
                                      partido: _partido,
                                      ano:     _ano,
                                      mes:     _mes,
                                      lista:   false
                                  )
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 132, 199),
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                    ),
                    child: const Center(
                      child: Text(
                        'Pesquisar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

