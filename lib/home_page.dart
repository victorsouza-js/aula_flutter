import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
void increment(){
  setState(() {
    count--;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        
        child: Text(
          
          '$count',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:increment,
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.remove, size: 30, color: Colors.white),
        
      ),
      
      appBar: AppBar(
        
        actions: [
        
          
          IconButton(onPressed: (){}, icon: Icon(Icons.access_time, size: 20, color: Colors.yellow),),
          IconButton(onPressed: (){}, icon: Icon(Icons.battery_full, size: 20, color: Colors.yellow),),
          
        ],
        
        title: Text('Contador',style: TextStyle(color: Colors.white,fontSize: 15),),
        backgroundColor: Colors.blueAccent,
        
      ),
    );
  }
}
