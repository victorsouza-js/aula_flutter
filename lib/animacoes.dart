import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

void main(List<String> args) {
  runApp(Animacoes());
}

class Animacoes extends StatefulWidget {
  const Animacoes({super.key});

  @override
  State<Animacoes> createState() => _AnimacoesState();
}

class _AnimacoesState extends State<Animacoes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Lottie.network(
            'https://lottie.host/719396bf-5fba-4968-88a3-db8660a9c0b5/pgWjIhacBO.json',
            width: 100,
          ),
        ),
      ),
    );
  }
}
