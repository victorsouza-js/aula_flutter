import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('AppBar', style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,color: Colors.white,))
        ],
      ),

      drawer: Drawer(),
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: TextField(
            
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(10)
              ),
          
              hintText: 'E-mail',
              hintStyle: TextStyle(color: Colors.black)
          
            
            ),
            
          )),
        ),

        Padding(padding: const EdgeInsets.all(8.0),
        child: Form(
            child: TextField(
            
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(10)
              ),
          
              hintText: 'Senha',
              hintStyle: TextStyle(color: Colors.black)
          
            
            ),
            
          )),
        )
        ],
      ),
    );
  }
}
