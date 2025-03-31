import 'package:aula_flutter_2/app_widget.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppWidget());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home: Scaffold(
        body: Container(
        
        ),
      ),
    );
  }
}
