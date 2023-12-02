import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  int resultado = 0;

  void calcularSomatorio() {
    int numero = int.tryParse(_controller.text) ?? 0;

    int soma = 0;
    for (int i = 0; i < numero; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        soma += i;
      }
    }

    setState(() {
      resultado = soma;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafio Técnico 1: divisíveis por 3 ou 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                '$resultado',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Insira um número'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calcularSomatorio();
              },
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
