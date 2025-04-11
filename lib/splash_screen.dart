import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 116, 62),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            Lottie.network(
              'https://lottie.host/15a28822-5eb3-4f10-aaca-279fd8e92042/Lpjdsraidx.json',
            ),
            SizedBox(height: 100),
            CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
