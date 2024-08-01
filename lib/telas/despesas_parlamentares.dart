import 'package:flutter/material.dart';

class ParliamentaryExpensesScreen extends StatefulWidget {
  const ParliamentaryExpensesScreen({super.key});

  @override
  _ParliamentaryExpensesScreenState createState() =>
      _ParliamentaryExpensesScreenState();
}

class _ParliamentaryExpensesScreenState
    extends State<ParliamentaryExpensesScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = 'Eduardo Paes';
  String _party = 'PT';
  String _year = '2024'; // Set the year to 2024 and make it non-editable
  String _month = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Parlamentares',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Nome do Parlamentar'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome de um parlamentar';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextFormField(
                initialValue: _party,
                decoration: const InputDecoration(labelText: 'Partido'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome de um partido';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _party = value;
                  });
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      initialValue: _year,
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
                          _year = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      initialValue: _month,
                      decoration: const InputDecoration(labelText: 'Mês'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor. insira um mês';
                        }
                        int? month = int.tryParse(value);
                        if (month == null || month < 1 || month > 12) {
                          return 'Mês inválido';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _month = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ParliamentaryExpensesResultScreen(
                                    name: _name,
                                    party: _party,
                                    year: _year,
                                    month: _month)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParliamentaryExpensesResultScreen extends StatelessWidget {
  final String name;
  final String party;
  final String year;
  final String month;

  const ParliamentaryExpensesResultScreen(
      {super.key, required this.name,
      required this.party,
      required this.year,
      required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Resultado Despesas', style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Parlamentar: $name', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text('Partido: $party', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text('Ano: $year', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text('Mês: $month', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
