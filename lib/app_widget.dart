import 'package:aula_flutter_2/animacoes.dart';
import 'package:aula_flutter_2/home_page.dart';
import 'package:aula_flutter_2/home_page_2.dart';
import 'package:aula_flutter_2/splash_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
