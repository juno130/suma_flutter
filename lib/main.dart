import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Suma'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _total = 0;
  String _varStrA = "";
  String _varStrB = "";
  int _varA = 0;
  int _varB = 0;

  final textfA = TextEditingController();
  final textfB = TextEditingController();

  void _Sumar() {
    setState(() {
      _varStrA = textfA.text;
      _varStrB = textfB.text;

      if (int.tryParse(_varStrA) == null || int.tryParse(_varStrB) == null) {
        _total = 0;
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Alerta"),
                  content: Text("Debe de Ingresar solo numeros"));
            });
        return;
      }

      _varA = int.parse(_varStrA);
      _varB = int.parse(_varStrB);
      _total = _varA + _varB;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: const InputDecoration(labelText: 'Variable A'),
                keyboardType: TextInputType.number,
                controller: textfA,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]),
            TextField(
              decoration: const InputDecoration(labelText: "Variable B"),
              keyboardType: TextInputType.number,
              controller: textfB,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const Text(
              'La Suma es:',
            ),
            Text(
              '$_total',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  _Sumar();
                },
                child: const Text('SUMAR'))
          ],
        ),
      ),
    );
  }
}
