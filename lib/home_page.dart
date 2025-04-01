import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final List<String> _tarefas = [];
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'AppBar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),

      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(height: 40),

          Center(child: Icon(Icons.account_circle, size: 60)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelText: 'Digitar item',
                  labelStyle: TextStyle(color: Colors.black),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Preencha corretamente';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) ;
            },
            child: Text('Adcionar'),
          ),
        ],
      ),
    );
  }
}
