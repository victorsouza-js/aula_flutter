import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tarefas = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void _addTarefa() {
      if (_formKey.currentState!.validate()) ;
      setState(() {
        _tarefas.add(_controller.text);
        _controller.clear();
      });
    }

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
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  labelText: 'Adcionar tarefa',
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),

            onPressed: _addTarefa,
            child: Text('Adcionar'),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(leading: Icon(Icons.account_circle),title: Text(_tarefas[index],
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              subtitle: Text('Mais Informações'),
              trailing: Icon(Icons.add_circle),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
