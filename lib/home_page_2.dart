import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(HomePage2());
}

class HomePage2 extends StatefulWidget {
  void alterando() {}

  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool clicou = false;

  void alterando() {
    setState(() {
      clicou = !clicou;
      print(clicou);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: InkWell(
          onTap: () {
            setState(() {
              clicou = !clicou;
            });
            print(clicou);
          },
          child: AnimatedAlign(
            
            alignment:
                clicou == true ? Alignment.bottomLeft : Alignment.topRight,
            duration: Duration(seconds: 1),

            curve: Curves.bounceInOut,

            child: Container(
              width: 100,
              height: 100,

              decoration: BoxDecoration(
                color: Colors.blueAccent,
                
                borderRadius:
              clicou == true
                        ? BorderRadius.all(Radius.circular(0))
                        : BorderRadius.all(Radius.circular(100)), 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
