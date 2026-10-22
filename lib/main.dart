import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Calculator combustibil')),
      body: FuelCalculator(),
    ),
  ));
}

class FuelCalculator extends StatefulWidget {
  @override
  State<FuelCalculator> createState() => _FuelCalculatorState();
}

class _FuelCalculatorState extends State<FuelCalculator> {
  final distance = TextEditingController();
  final fuel = TextEditingController();
  String result = '';

  void calculate() {
    double d = double.parse(distance.text);
    double f = double.parse(fuel.text);

    setState(() {
      result = 'Consum: ${(f / d * 100).toStringAsFixed(2)} L/100 km';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: distance,
          decoration: InputDecoration(labelText: 'Distanta (km)'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: fuel,
          decoration: InputDecoration(labelText: 'Combustibil (litri)'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: calculate,
          child: Text('Calculeaza'),
        ),
        Text(result),
      ],
    );
  }
}